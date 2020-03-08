package service

import (
	"errors"
	"fmt"
	"github.com/bing127/lt/server/db"
	"github.com/jinzhu/gorm"
	"strings"
)

func Create(t *db.Test) error {
	err := db.GetInstance().Create(&t).Error
	if err!= nil {
		if strings.Contains(err.Error(), "Error 1062") {
			return errors.New(fmt.Sprintf("%s已存在",t.Name))
		}
		return errors.New(err.Error())
	}
	return nil
}

func GetTestById(id string) (*db.Test,error) {
	test := &db.Test{}
	err := db.GetInstance().Where("id = ?", id).First(test).Error
	if err!= nil {
		if gorm.IsRecordNotFoundError(err) {
			return nil,errors.New("没有符合条件的用户")
		}
		return nil,errors.New(err.Error())
	}
	return test,nil
}

func DeleteById(id string) error {

	test,err := GetTestById(id)
	if err != nil {
		return errors.New(err.Error())
	}
	if test != nil {
		err := db.GetInstance().Where("id = ?", id).Unscoped().Delete(test).Error
		if err!= nil {
			if gorm.IsRecordNotFoundError(err) {
				return errors.New("没有符合条件的用户")
			}
			return errors.New(err.Error())
		}
		return nil
	}
	return nil
}

func UpdateTest(test *db.Test) error {
	err := db.GetInstance().Model(&test).Updates(test).Error
	if err != nil {
		return errors.New(err.Error())
	}
	return nil
}