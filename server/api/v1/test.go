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
	err := c.ShouldBindJSON(request)
	if err != nil {
		c.JSON(http.StatusOK, utils.ResponseJson("缺少必要参数", nil, false, nil))
		return
	}
	testId := utils.GetUUID()
	test := &db.Test{
		ID:         testId,
		Name:       request.Name,
		CreateAt:   0,
		CreateDate: utils.GetCurrentTimeStamp(),
		UpdateAt:   0,
		UpdateDate: utils.GetCurrentTimeStamp(),
	}

	err = service.Create(test)
	if err != nil {
		c.JSON(http.StatusOK, utils.ResponseJson(string(err.Error()), nil, false, nil))
		return
	}
	c.JSON(http.StatusOK, utils.ResponseJson("创建成功", &test, true, nil))
	return
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
	err := service.DeleteById(IdStr)
	if err != nil {
		c.JSON(http.StatusOK, utils.ResponseJson(err.Error(), nil, false, nil))
		return
	}
	c.JSON(http.StatusOK, utils.ResponseJson("删除成功", nil, true, nil))
	return
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
// @Router /lt/api/v1/test/{id} [get]
func GetTest(c *gin.Context) {
	testId := c.Param("id")
	test,err := service.GetTestById(testId)
	if err!=nil {
		c.JSON(http.StatusOK, utils.ResponseJson(err.Error(), nil, false, nil))
		return
	}
	c.JSON(http.StatusOK, utils.ResponseJson("查询成功", &test, true, nil))
	return
}
