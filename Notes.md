# Terraform

## Installation
https://developer.hashicorp.com/terraform/install


### Useful Commands

```terraform fmt``` - Formats Terraform configuration file contents
https://developer.hashicorp.com/terraform/cli/commands/fmt

```terraform init``` - Initializes a working directory containing Terraform configuration files
https://developer.hashicorp.com/terraform/cli/commands/init

```terraform plan``` - Creates an execution plan
https://developer.hashicorp.com/terraform/cli/commands/plan

```terraform apply``` - Executes the actions proposed in a Terraform plan 
https://developer.hashicorp.com/terraform/cli/commands/apply

### Terraform Providers
[Google Cloud Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

[Google Cloud Storage Bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket.html)



# Kestra

## Installation
https://kestra.io/docs/installation


# dbt

## Installation
[pip install](https://docs.getdbt.com/docs/core/pip-install)

[Docker Install](https://docs.getdbt.com/docs/core/docker-install)

```dbt init```

docker pull ghcr.io/dbt-labs/dbt-bigquery:1.9.latest

docker run --network=host --mount type=bind,source=$(pwd)/dbt/dbt_citibike,target=/usr/app --mount type=bind,source=$
(pwd)/dbt/profiles.yml,target=/root/.dbt/profiles.yml ghcr.io/dbt-labs/dbt-bigquery ls