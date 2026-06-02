variable "hosted_zone_id" {
  type = string
}

variable "alias" {
  type = object({
    from = string
    to   = string
  })
}
