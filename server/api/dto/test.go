package dto


type CreateTestRequest struct {
	Name     string `json:"name" binding:"required"`
}

type PutTestRequest struct {
	Id     string `json:"id" binding:"required"`
	Name     string `json:"name" binding:"required"`
}