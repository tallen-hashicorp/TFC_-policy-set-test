# Terraform Policy Set Parameter Test

This Terraform configuration demonstrates testing the **`tfe_policy_set_parameter`** resource with a Terraform Cloud (TFC) organization. It creates a Sentinel policy set in TFC and attaches a sensitive parameter to it.

## Features

- **TFC Provider Configuration**: Connects to Terraform Cloud using the `tfe` provider.
- **Policy Set Creation**: Defines a Sentinel policy set with a description and `global` scope.
- **Policy Set Parameter**: Attaches a sensitive parameter (`test_sensitive_param`) to the policy set.

## Prerequisites

1. **Terraform**: Ensure Terraform CLI is installed (>= 1.0).
2. **TFC Token**: A Terraform Cloud API token with permissions to create policy sets.
3. **TFC Organization**: Name of your Terraform Cloud organization.

## Variables

The configuration uses the following variables:

| Name          | Description                                    | Required | Example Value       |
|---------------|------------------------------------------------|----------|---------------------|
| `tfc_token`   | API token for Terraform Cloud                  | Yes      | `my-tfc-api-token` |
| `tfc_org`     | Name of your Terraform Cloud organization      | Yes      | `my-organization`  |

## Usage

1. Clone the repository or copy the configuration into a directory.
2. Create a `terraform.tfvars` file to provide values for the required variables:
   ```hcl
   tfc_token = "your-tfc-token"
   tfc_org   = "your-organization"
   ```
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Plan the configuration to preview changes:
   ```bash
   terraform plan
   ```
5. Apply the configuration to create resources in TFC:
   ```bash
   terraform apply
   ```

## Resources

The configuration manages the following resources:

- **`tfe_policy_set`**: Creates a Sentinel policy set in TFC with the name `test_policy_set`.
- **`tfe_policy_set_parameter`**: Attaches a sensitive parameter (`test_sensitive_param`) to the policy set.

## Example Output

After applying the configuration, the Sentinel policy set and its sensitive parameter will be created in your Terraform Cloud organization. Verify the setup in the Terraform Cloud web interface.

## Notes

- The `sensitive` attribute of `tfe_policy_set_parameter` ensures the parameter value is not exposed in Terraform state files.
- **Do not share your TFC token** to prevent unauthorized access to your Terraform Cloud organization.

## Cleanup

To remove the resources created by this configuration, run:

```bash
terraform destroy
```

This will delete the policy set and its parameters from your Terraform Cloud organization.
