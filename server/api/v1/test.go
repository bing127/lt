package v1

import (
	"github.com/bing127/lt/server/api/dto"
	"github.com/bing127/lt/server/db"
	"github.com/bing127/lt/server/service"
	"github.com/bing127/lt/server/utils"
	"github.com/gin-gonic/gin"
	"net/http"
)

// CreateTest godoc
// @Summary 创建test
// @Description 创建test
// @Tags test
// @Accept  json
// @Produce json
// @Param CreateTestRequest body dto.CreateTestRequest true "test信息"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/test [post]
func CreateTest(c *gin.Context) {
	request := &dto.CreateTestRequest{}
	if err := c.ShouldBindJSON(request); err != nil {
		c.JSON(http.StatusOK, utils.ResponseJson("缺少必要参数", nil, false, nil))
		return
	}
	test := &db.Test{
		ID:         utils.GetUUID(),
		Name:       request.Name,
		CreateAt:   0,
		CreateDate: utils.GetCurrentTimeStamp(),
		UpdateAt:   0,
		UpdateDate: utils.GetCurrentTimeStamp(),
	}

	err := service.Create(test)
	if err != nil {
		c.JSON(http.StatusOK, utils.ResponseJson("创建失败", nil, false, nil))
		return
	}
	c.JSON(http.StatusOK, utils.ResponseJson("创建成功", nil, true, nil))
}

// DeleteTest godoc
// @Summary 删除test
// @Description 删除test
// @Tags test
// @Accept  json
// @Produce json
// @Param id path string true "ID"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/test{id} [delete]
func DeleteTest(c *gin.Context) {
	IdStr := c.Param("id")
	if len(IdStr) <= 0 {
		c.JSON(http.StatusBadRequest, utils.ResponseJson("缺少必要参数id", nil, false, nil))
		return
	}

}

// UpdateTest godoc
// @Summary 更改test
// @Description 更改test
// @Tags test
// @Accept  json
// @Produce json
// @Param PutTestRequest body dto.PutTestRequest true "test信息"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/test [put]
func UpdateTest(c *gin.Context) {

}

// GetTest godoc
// @Summary 根据ID获取test
// @Description 根据ID获取test
// @Tags test
// @Accept  json
// @Produce json
// @Param id path string true "ID"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/test/{roomId} [get]
func GetTest(c *gin.Context) {

}
