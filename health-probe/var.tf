variable "probes" {
  type = map(object({
    name     = string
    port     = number
    protocol = string
  }))
}
