package v1

import (
	"github.com/bing127/lt/server/api/dto"
	"github.com/bing127/lt/server/db"
	"github.com/bing127/lt/server/service"
	"github.com/bing127/lt/server/utils"
	"github.com/gin-gonic/gin"
	"net/http"
)

// CreateDict godoc
// @Summary 创建字典
// @Description 创建字典
// @Tags 字典
// @Accept  json
// @Produce json
// @Param CreateTestRequest body dto.CreateDictRequest true "字典信息"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/dict [post]
func CreateDict(c *gin.Context) {
	request := &dto.CreateDictRequest{}
	err := c.ShouldBindJSON(request)
	if err != nil {
		c.JSON(http.StatusOK, utils.ResponseJson("缺少必要参数", nil, false, nil))
		return
	}
	id := utils.GetUUID()
	dict := &db.Dict{
		ID:          id,
		Name:        request.Name,
		Description: request.Description,
		CreateAt:    0,
		CreateDate:  utils.GetCurrentTimeStamp(),
		UpdateAt:    0,
		UpdateDate:  utils.GetCurrentTimeStamp(),
	}
	dictErr := service.CreateDict(dict)
	if dictErr!=nil {
		c.JSON(http.StatusOK, utils.ResponseJson(dictErr.Error(), nil, false, nil))
		return
	}
	c.JSON(http.StatusOK, utils.ResponseJson("创建成功", &dict, true, nil))
	return

}

// DeleteDict godoc
// @Summary 删除dict
// @Description 删除dict
// @Tags 字典
// @Accept  json
// @Produce json
// @Param id path string true "ID"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/dict/{id} [delete]
func DeleteDict(c *gin.Context) {}

// UpdateDict godoc
// @Summary 更新dict
// @Description 更新dict
// @Tags 字典
// @Accept  json
// @Produce json
// @Param PutTestRequest body dto.PutDictRequest true "dict信息"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/dict [put]
func UpdateDict(c *gin.Context) {
}

// GetDict godoc
// @Summary 根据ID获取dict
// @Description 根据ID获取dict
// @Tags 字典
// @Accept  json
// @Produce json
// @Param id path string true "ID"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/dict/{id} [get]
func GetDict(c *gin.Context) {}


// CreateValue godoc
// @Summary 创建字典值
// @Description 创建字典值
// @Tags 字典
// @Accept  json
// @Produce json
// @Param CreateTestRequest body dto.CreateValueRequest true "字典值信息"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/value [post]
func CreateValue(c *gin.Context) {

}
// DeleteValue godoc
// @Summary 删除d字典值
// @Description 删除字典值
// @Tags 字典
// @Accept  json
// @Produce json
// @Param id path string true "ID"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/value/{id} [delete]
func DeleteValue(c *gin.Context) {}

// UpdateValue godoc
// @Summary 更新字典值
// @Description 更新字典值
// @Tags 字典
// @Accept  json
// @Produce json
// @Param PutTestRequest body dto.PutValueRequest true "字典值信息"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/value [put]
func UpdateValue(c *gin.Context) {}


// GetValue godoc
// @Summary 根据ID获取dict值
// @Description 根据ID获取dict值
// @Tags 字典
// @Accept  json
// @Produce json
// @Param id path string true "ID"
// @Success 200 { string } json
// @Failure 400 { string } json
// @Failure 500 { string } json
// @Router /lt/api/v1/value/{id} [get]
func GetValue(c *gin.Context) {}