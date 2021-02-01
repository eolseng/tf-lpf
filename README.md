# Terraform Linear Promotion Flow (LPF)
Testing out my own Linear Promotion Flow for Terraform deployment via Circle-CI.

Using multiple environments in Terraform is confusing.
You have a folder for each environment with almost identical code and different branches for each environment.
Promoting code from development to staging requires you to:
* Checkout 'development' branch
* Copy code from 'development' folder to 'staging' folder
* Reconfigure for the 'staging'-environment
* Open a pull request from 'development' branch to 'staging' branch
    * This does not trigger CI Workflows in the 'staging' folder / infrastructure
* Merge the request
    * This will trigger a CI Workflow to do 'terraform plan', manually approve the plan and then 'terraform apply' on the 'staging' environment

This includes a lot of manual labour, a high level of precision for configuration and many points of potential failure.

## HOW TO CONFIGURE ARTIFACT VERSIONING BETWEEN ENVIRONMENTS?
### ./setup/versions/{environment}.tfvars
* Configure a .tfvars for each environment that is loaded in Circle-CI
    * Staging and Production should reference the same file. This ensures that 'production' uses the same versions as tested in 'staging'.
    * Development should reference static files. Application Code Commits should trigger the 'development' environment to use the latest environment.
