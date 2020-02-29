package http_client

import (
	"net/http"
	"strings"
	"time"
)

type HTTPClient struct {
	httpClient http.Client

	baseUrl    string
	timeoutSec int64
}

func NewHttpClient(baseUrl string, timeoutSec int64) *HTTPClient {
	client := new(HTTPClient)
	client.baseUrl = baseUrl
	client.timeoutSec = timeoutSec

	if client.timeoutSec != 0 {
		client.httpClient.Timeout = time.Duration(client.timeoutSec) * time.Second
	}

	return client
}

func DestroyHttpClient(client *HTTPClient) {
	if client == nil {
		return
	}

	client.timeoutSec = 0
	client.baseUrl = ""

	client = nil
}

func (client *HTTPClient) Get(uri string, token string) (*http.Response, error) {
	req, err := http.NewRequest("GET", client.baseUrl+uri, nil)
	if err != nil {
		return nil, err
	}

	if len(token) != 0 {
		req.Header.Add("Authorization", token)
	}

	return client.httpClient.Do(req)
}

func (client *HTTPClient) Post(uri string, request string, contentType string, token string) (*http.Response, error) {
	req, err := http.NewRequest("POST", client.baseUrl+uri, strings.NewReader(request))
	if err != nil {
		return nil, err
	}

	req.Header.Add("Content-Type", contentType)

	if len(token) != 0 {
		req.Header.Add("Authorization", token)
	}

	return client.httpClient.Do(req)
}

func (client *HTTPClient) Delete(uri string, contentType string, token string) (*http.Response, error) {
	req, err := http.NewRequest("DELETE", client.baseUrl+uri, nil)
	if err != nil {
		return nil, err
	}

	req.Header.Add("Content-Type", contentType)

	if len(token) != 0 {
		req.Header.Add("Authorization", token)
	}

	return client.httpClient.Do(req)
}

func (client *HTTPClient) Put(uri string, request string, contentType string, token string) (*http.Response, error) {
	req, err := http.NewRequest("PUT", client.baseUrl+uri, strings.NewReader(request))
	if err != nil {
		return nil, err
	}

	req.Header.Add("Content-Type", contentType)

	if len(token) != 0 {
		req.Header.Add("Authorization", token)
	}

	return client.httpClient.Do(req)
}
