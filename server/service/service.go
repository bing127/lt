package service

import "github.com/bing127/lt/server/db"

// Init 初始化service
func Init() {
	db.Open()
}

// Destroy 销毁service
func Destroy() {
	db.Close()
}
