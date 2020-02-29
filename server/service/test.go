package service

import (
	"errors"
	"github.com/bing127/lt/server/db"
)

func Create(t *db.Test) error {
	err := db.GetInstance().Create(&t).Error
	if err!= nil {
		return errors.New(err.Error())
	}
	return nil
}