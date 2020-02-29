package main

import (
	"context"
	"github.com/bing127/lt/server/config"
	"github.com/bing127/lt/server/router"
	"github.com/bing127/lt/server/service"
	"github.com/gin-gonic/gin"
	DEATH "gopkg.in/vrecan/death.v3"
	"log"
	"net/http"
	"syscall"
	"time"
)

// @title 后台
// @version latest
// @BasePath /
func main() {
	service.Init()
	defer service.Destroy()

	r := gin.Default()

	router.InitRouter(r)

	srv := &http.Server{
		Addr:    ":" + config.Admin.Server.Port,
		Handler: r,
		ReadTimeout:    config.Admin.Server.ReadTimeout * 1000,
		WriteTimeout:   config.Admin.Server.WriteTimeout * 1000,
		MaxHeaderBytes: 1 << 20,
	}

	go func() {
		if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("listen: %s\n", err)
		}
	}()

	death := DEATH.NewDeath(syscall.SIGINT, syscall.SIGTERM)
	_ = death.WaitForDeath()
	log.Println("Shutdown Server ...")

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if err := srv.Shutdown(ctx); err != nil {
		log.Fatal("Server Shutdown:", err)
	}

	log.Println("Server exiting")
}
