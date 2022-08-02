variable "permission_sets" {
  type        = list(string)
  default     = []
  description = "The permission sets whose Role ARNs you want. Do not set to get all such ARNs."
  nullable    = false
}
