provider "kubernetes" {
  load_config_file = "false"
  insecure = "true"

  host = "https://kubernetes:6443"

  token = "eyJhbGciOiJSUzI1NiIsImtpZCI6ImNJVHNqNUVPbDFFN292bXVvTFp3ZENEYzJkaVpYeldmdmNKbDFITUoxN2sifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJqZW5raW5zIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImplbmtpbnMtdG9rZW4tendwZmwiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiamVua2lucyIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImQwNTgzNGY2LTc0Y2YtNDIzNi1hNTg3LTRjMjIzOGE3YjAzMSIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpqZW5raW5zOmplbmtpbnMifQ.B3uYCNCQjIrN4-oELa0I6HhitSCIgOz_kSdZLAeKQVGr-1QEPpva4DVM2DVdAktq2jUA6uRjg7qXg3nh8pAqVvUioOxUSwpz-hpbj1RY7ntXQipMzPsI-Ye1o8tri27x8mW70zrJdrcmSKCh7clHbFbftm_cpnKTUc6l_ztbX1PPioHLPLMhqyiauCQz_1z1BUPjJg3_zaKYUrY2RMInjOjyBygWS-7gjGVwkEQoL3DZkil8cYOdRr6fG3czzxUvnHOuXTADy40gd7MqZJiKTWbntU_nfNE9TWAHjT-bDZoK9K5g5Ym2zdMWHj0XmWNs48TNi3PmDvLF5Ev8Dy-fcw"
}
resource "kubernetes_namespace" "example" {
  metadata {
    name = "terraform-namespace"
  }
}