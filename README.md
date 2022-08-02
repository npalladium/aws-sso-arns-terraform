# AWS SSO ARNs Terraform Module

Terraform module to get Role ARNs given SSO Permission Set names.

Note: AWS Single Sign-On (AWS SSO) is now called AWS IAM Identity Center.

[![experimental](http://badges.github.io/stability-badges/dist/experimental.svg)](http://github.com/badges/stability-badges)

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

## Usage
```terraform
module "sso_roles" {
  source          = "git::git@github.com:npalladium/terraform-aws-sso-arns.git"
  permission_sets = ["AWSAdministratorAccess", "AWSOrganizationsFullAccess"] # leave unset to get all
}
```

## Caveats

Please keep the following in mind:
- This module isn't marked "production-ready".
- Given the size, simplicity and stability of this module, it is probably best to just copy the code over than add a dependency to it.

## Module Documentation
<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | ~> 4.0 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| permission\_sets | The permission sets whose Role ARNs you want. Do not set to get all such ARNs. | `list(string)` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| arns | ARNs of the Roles created for Permission Sets given. These ARNs do not have the path. |
| arns\_with\_path | ARNs of the Roles created for Permission Sets given with the path. Do not use these for EKS. |
| regex | Regex used to filter for the path. |
<!-- END_TF_DOCS -->

## Contributing
Contributions are welcome in the form of PRs or issues.

## License

[MIT](https://choosealicense.com/licenses/mit/)
