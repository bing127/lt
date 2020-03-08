package dto

type CreateDictRequest struct {
	Name        string `json:"name" binding:"required"`
	Description string `json:"description" binding:"required"`
}

type PutDictRequest struct {
	Id string `json:"id" binding:"required"`
	CreateDictRequest
}

type CreateValueRequest struct {
	DictId string `json:"dict_id" binding:"required"`
	Name   string `json:"name" binding:"required"`
}

type PutValueRequest struct {
	Id   string `json:"id" binding:"required"`
	Name string `json:"name" binding:"required"`
}
