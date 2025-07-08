# cloud-iac/stacks/accounts/test-account.tf

module "aft_account_test" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory//modules/aft-account-request"

  control_tower_parameters = {
    AccountName     = "test-account"
    AccountEmail    = "test-account@careforceone.net"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail    = "test-user@careforceone.net"
    SSOUserFirstName = "Test"
    SSOUserLastName  = "User"
  }

  account_tags = {
    environment = "test"
    owner       = "test-team"
  }

  change_management_parameters = {
    change_requested_by = "automation"
    change_reason       = "create test account"
  }
}

