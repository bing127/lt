package db

import (
	"fmt"
	"github.com/bing127/lt/server/config"
	"log"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var gormDb *gorm.DB

// Open 打开数据库
func Open() {
	mysqlConfig := config.Admin.Db
	template := "%s:%s@tcp(%s)/%s?charset=utf8mb4&parseTime=True&loc=Local"
	connStr := fmt.Sprintf(template, mysqlConfig.User, mysqlConfig.Password, mysqlConfig.Host, mysqlConfig.Schema)
	openDb, err := gorm.Open("mysql", connStr)
	if err != nil {
		log.Println(err.Error())
		panic("数据库连接异常")
	}

	openDb.LogMode(true)
	openDb.SingularTable(true)
	gormDb = openDb

	autoMigrate(&Test{})
}

// Close 关闭数据库
func Close() {
	_ = gormDb.Close()
	gormDb = nil
}

// GetInstance 获取数据库实例
func GetInstance() *gorm.DB {
	return gormDb
}

func autoMigrate(values ...interface{}) {
	gormDb.AutoMigrate(values...)
}
