locals {
  regex_patterns = [for ps in var.permission_sets : "AWSReservedSSO_${ps}_*"]
  name_regex     = length(var.permission_sets) == 0 ? null : join("|", local.regex_patterns)
}

data "aws_iam_roles" "roles" {
  name_regex  = local.name_regex
  path_prefix = "/aws-reserved/sso.amazonaws.com/"
}

locals {
  arns_without_path = [
    for parts in [for arn in data.aws_iam_roles.roles.arns : split("/", arn)] :
    "${parts[0]}/${element(parts, length(parts) - 1)}"
  ]
}
