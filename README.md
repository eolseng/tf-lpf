# Terraform Linear Promotion Flow (LPF)
Testing out my own Linear Promotion Flow for Terraform deployment via Circle-CI.

This flow utilizes a single codebase for all environments, but it gets configured differently for each branch, e.g.:
* A push to 'development' makes Terraform load the './setup/backends/development.tf' backend configuration and './development.tfvars'.

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

## Hvordan konfigurere artifakt-versjoner i de forskjellige miljøene?
* Prosjektet bruker nå egne .tfvars for hvert miljør ('development', 'staging', 'production')
* En svakheter ved dette er at man må kopiere over konfigurasjon fra staging.tfvars til production.tfvars når staging er godkjent og klar for promotering til 'production'.
  * En promotering fra 'staging' til 'production' burde automatisk promotere versjonsvalget. På den måten er man sikret at det man har testet i 'staging' er det man har i 'production'.
  * Motargrument er konfigurasjon av databaser / persistent lagring - her må 'staging' peke på en annen database enn 'production'.
* Fortsatt usikker på hvordan man skal håndtere kode-artefakter
  * dev-versjoner av kode skal dyttes til inf.prod sin 'dev-code' S3 Bucket, prod-versjoner av kode til inf.prod sin 'prod-code'.
  * inf.dev. sine Lambda funksjoner skal hente artefakter fra inf.prod sin 'dev-code' S3 Bucket.
    * Hvordan håndtere dette ved splitting av inf.dev. og inf.prod. på forskjellige AWS kontoer?

### ./{environment}.tfvars
* Configure a .tfvars for each environment that is loaded in Circle-CI
    * Staging and Production should reference the same file. This ensures that 'production' uses the same versions as tested in 'staging'.
    * Development should reference static files. Application Code Commits should trigger the 'development' environment to use the latest environment.
