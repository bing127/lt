package router

import (
	"github.com/bing127/lt/server/config"
	_ "github.com/bing127/lt/server/docs"
	"github.com/bing127/lt/server/utils"
	"github.com/gin-gonic/gin"
	ginSwagger "github.com/swaggo/gin-swagger"
	"github.com/swaggo/gin-swagger/swaggerFiles"
	"net/http"
	"os"
)


func InitRouter(r *gin.Engine) {
	if !utils.PathExists(config.Admin.File.Dir) {
		err := os.MkdirAll(config.Admin.File.Dir, os.ModePerm|os.ModeDir)
		if err != nil {
			panic(err)
		}
	}
	//// 日志
	//r.Use(gin.Logger())

	// 从panic中恢复
	r.Use(gin.Recovery())

	// 静态资源路径
	r.Static(config.Admin.File.Path, config.Admin.File.Dir)

	// swagger
	r.GET(config.Admin.App.ApiPrefix+"/doc/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))


	// 404路由
	r.NoRoute(func(c *gin.Context) {
		c.JSON(http.StatusNotFound, utils.NotFound())
	})
	// 管理后端使用的API
	initAdminRouter(r)
}
