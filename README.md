# de-zoomcamp-project

### 1. Project Setup

1. Python version maintained in project using Pyenv
https://github.com/pyenv/pyenv


2. 

Technologies:
- **Cloud** - GCP
- **Infrastructure as Code** - Terraform
- **Workflow Orchestration:** Kestra
Kestra has proven to be over-complicated for what I need to accomplish. It seems to fundamentally operate around an expectation of single input and output files. I've run into this issue with two different datasets now (citi-bike-nyc [https://citibikenyc.com/system-data] and divvy bikes [https://divvybikes.com/system-data]) where the zip archives contains multiple files and hit a roadblock trying to process these files. While the object is called outputFiles, I cannot find a single example in the documentation that demonstrates references more than one at a time.
What I was able to script in 30 minutes, has taken days with no solution in site. Reverted to using a simple shell script to extract my data.
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
