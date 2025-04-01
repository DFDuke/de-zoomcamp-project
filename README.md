# de-zoomcamp-project

### 1. Project Setup

1. Python version maintained in project using Pyenv
https://github.com/pyenv/pyenv



2. 

Technologies:
- **Cloud** - GCP
- **Infrastructure as Code** - Terraform
- **Workflow Orchestration:** Airflow / Kestra - TBD
- **Date Warehouse:** Big Query
- **Batch Processing:** Spark/Flink



Problem Description:
- Problem is well described and it's clear what the problem the project solves

Cloud:
- The project is developed in the cloud and IaC tools are used

Data Ingestion:
- End-to-end pipeline: multiple steps in the DAG, uploading data to data lake
- Batch / Airflow/Kestra

Data Warehouse:
- Tables are partitioned and clustered in a way that makes sense for the upstream queries (with explanation)

Transformations:
- Tranformations are defined with dbt, Spark or similar technologies

Dashboard:
- A dashboard with 2 tiles

Reproducibility:
- Instructions are clear, it's easy to run the code, and the code works
