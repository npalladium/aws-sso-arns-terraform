output "arns" {
  value       = local.arns_without_path
  description = "ARNs of the Roles created for Permission Sets given. These ARNs do not have the path."
}

output "arns_with_path" {
  value       = data.aws_iam_roles.roles.arns
  description = "ARNs of the Roles created for Permission Sets given with the path. Do not use these for EKS."
}

output "regex" {
  value       = data.aws_iam_roles.roles.name_regex
  description = "Regex used to filter for the path."
}
