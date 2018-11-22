package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Accessed")
		fmt.Fprintf(w, "Hello, World")
	})
	port := 8080
	log.Printf("Start Server: %d", port)
	http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
}
