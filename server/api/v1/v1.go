package v1

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"github.com/bing127/lt/server/config"
)

// V1 godoc
// @Summary 获取平台版本
// @Description 获取平台版本
// @Tags 获取平台版本
// @Success 200 {string} string
// @Router /lt/api/v1 [get]
func V1(c *gin.Context) {
	c.String(http.StatusOK, "Version: "+config.Admin.App.Version)
}
