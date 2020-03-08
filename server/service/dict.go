package service

import (
	"errors"
	"fmt"
	"github.com/bing127/lt/server/db"
	"strings"
)

func CreateDict(d *db.Dict) error {
	err := db.GetInstance().Create(&d).Error
	if err!= nil {
		if strings.Contains(err.Error(), "Error 1062") {
			return errors.New(fmt.Sprintf("%s已存在",d.Name))
		}
		return errors.New(err.Error())
	}
	return nil
}
