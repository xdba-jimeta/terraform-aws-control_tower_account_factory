module "aft_code_repositories" {
  providers = {
    aws = aws.aft_management
  }
  source                                          = "./modules/aft-code-repositories"
  vpc_id                                          = module.aft_account_request_framework.aft_vpc_id
  aft_config_backend_bucket_id                    = module.aft_backend.bucket_id
  aft_config_backend_table_id                     = module.aft_backend.table_id
  aft_config_backend_kms_key_id                   = module.aft_backend.kms_key_id
  account_request_table_name                      = module.aft_account_request_framework.request_table_name
  codepipeline_s3_bucket_arn                      = module.aft_customizations.aft_codepipeline_customizations_bucket_arn
  codepipeline_s3_bucket_name                     = module.aft_customizations.aft_codepipeline_customizations_bucket_name
  security_group_ids                              = module.aft_account_request_framework.aft_vpc_default_sg
  subnet_ids                                      = module.aft_account_request_framework.aft_vpc_private_subnets
  aft_key_arn                                     = module.aft_account_request_framework.aft_kms_key_arn

  # ✅ Add these:
  aft_configuration_repo_name                     = "aft-configuration"
  aft_configuration_repo_branch                   = "main"

  account_request_repo_branch                     = var.account_request_repo_branch
  account_request_repo_name                       = var.account_request_repo_name
  account_customizations_repo_name                = var.account_customizations_repo_name
  global_customizations_repo_name                 = var.global_customizations_repo_name
  github_enterprise_url                           = var.github_enterprise_url
  gitlab_selfmanaged_url                          = var.gitlab_selfmanaged_url
  vcs_provider                                    = var.vcs_provider
  terraform_distribution                          = var.terraform_distribution
  account_provisioning_customizations_repo_name   = var.account_provisioning_customizations_repo_name
  account_provisioning_customizations_repo_branch = var.account_provisioning_customizations_repo_branch
  account_customizations_repo_branch              = var.account_customizations_repo_branch
  global_customizations_repo_branch               = var.global_customizations_repo_branch
  log_group_retention                             = var.cloudwatch_log_group_retention
  global_codebuild_timeout                        = var.global_codebuild_timeout
  aft_enable_vpc                                  = module.aft_account_request_framework.vpc_deployment
}

