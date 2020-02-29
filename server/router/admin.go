package router

import (
	"github.com/bing127/lt/server/api/v1"
	"github.com/bing127/lt/server/config"
	"github.com/bing127/lt/server/middleware"
	"github.com/gin-gonic/gin"
)

var (
	v1PostRouter = map[string]gin.HandlerFunc{
		"/test":                    v1.CreateTest,
	}

	v1DeleteRouter = map[string]gin.HandlerFunc{
		"/test/:id":                v1.DeleteTest,
	}

	v1PutRouter = map[string]gin.HandlerFunc{
		"/test":                   v1.UpdateTest,
	}

	v1GetRouter = map[string]gin.HandlerFunc{
		"/test/:id":              v1.GetTest,
	}
)

func initAdminRouter(r *gin.Engine) {
	// 处理跨域请求
	r.Use(middleware.CorsHandler())

	r.GET(config.Admin.App.ApiPrefix+"/api/v1", v1.V1)
	//r.POST(config.Admin.App.ApiPrefix+"/api/admin/getAccessToken", v1.GetAccessToken)

	groupV1 := r.Group(config.Admin.App.ApiPrefix+"/api/v1")

	for path, f := range v1GetRouter {
		groupV1.GET(path, f)
	}

	for path, f := range v1PostRouter {
		groupV1.POST(path, f)
	}

	for path, f := range v1DeleteRouter {
		groupV1.DELETE(path, f)
	}

	for path, f := range v1PutRouter {
		groupV1.PUT(path, f)
	}
}
