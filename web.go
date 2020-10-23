package main

import (
    "fmt"
    "net/http"
    "os"
)

func main() {
    http.HandleFunc("/", HelloServer)
    http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	 fmt.Fprintf(w, "Devops 2020\n")
	 fmt.Fprintf(w, "Host: %s\n", os.Getenv("HOSTNAME"))

	 fmt.Fprintf(w, "\n")
	 fmt.Fprintf(w, "Variables de Ambiente: \n")
	 fmt.Fprintf(w, "FOO: %s\n", os.Getenv("FOO"))
	 fmt.Fprintf(w, "BAR: %s\n", os.Getenv("BAR"))

	 fmt.Fprintf(w, "\n")
	 fmt.Fprintf(w, "Credenciales: \n")
	 fmt.Fprintf(w, "SUPERSECRETUSER: %s\n", os.Getenv("SUPERSECRETUSER"))
	 fmt.Fprintf(w, "SUPERSECRETPASS: %s\n", os.Getenv("SUPERSECRETPASS"))
}