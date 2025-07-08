# cloud-iac/stacks/accounts/dev-account.tf

module "aft_account_dev" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory//modules/aft-account-request"

  control_tower_parameters = {
    AccountName     = "dev-account"
    AccountEmail    = "dev-account@careforceone.net"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail    = "dev-user@careforceone.net"
    SSOUserFirstName = "Dev"
    SSOUserLastName  = "User"
  }

  account_tags = {
    environment = "dev"
    owner       = "dev-team"
  }

  change_management_parameters = {
    change_requested_by = "automation"
    change_reason       = "create dev account"
  }
}

