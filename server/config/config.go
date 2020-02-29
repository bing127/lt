package config

import (
	"github.com/jinzhu/configor"
	"log"
	"time"
)

var Admin = struct {
	App struct {
		Name        string
		Description string
		Version     string
		ApiPrefix   string
	}
	Server struct {
		Port         string
		ReadTimeout  time.Duration
		WriteTimeout time.Duration
	}
	Db struct {
		Type     string
		Host     string
		User     string
		Password string
		Schema   string
		Port     string
		Log      bool
	}
	Mail struct {
		User     string
		Password string
		Host     string
		Port     string
	}
	Mode struct {
		Type string
	}
	File struct {
		Path   string
		Dir    string
		Max    int64
		Suffix []string
	}
	Jwt struct {
		Expires int
	}
}{}

func init() {
	var err error
	err = configor.Load(&Admin, "config/config.yml")
	if err != nil {
		log.Fatalf("Fail to parse 'config/config.yml': %v", err)
	}
}
