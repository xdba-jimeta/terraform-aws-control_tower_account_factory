# cloud-iac/stacks/accounts/prod-account.tf

module "aft_account_prod" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory//modules/aft-account-request"

  control_tower_parameters = {
    AccountName     = "prod-account"
    AccountEmail    = "prod-account@careforceone.net"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail    = "prod-user@careforceone.net"
    SSOUserFirstName = "Prod"
    SSOUserLastName  = "User"
  }

  account_tags = {
    environment = "prod"
    owner       = "prod-team"
  }

  change_management_parameters = {
    change_requested_by = "automation"
    change_reason       = "create prod account"
  }
}

