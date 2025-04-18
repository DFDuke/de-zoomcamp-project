# de-zoomcamp-project

### 1. Project Setup

1. Python version maintained in project using Pyenv
https://github.com/pyenv/pyenv



Technologies:
- **Cloud** - GCP
- **Infrastructure as Code** - Terraform
- **Workflow Orchestration:** Kestra
- **Date Warehouse:** Big Query
- **Batch Processing:** Kestra / Big Query



# Problem Description:
#### Problem is well described and it's clear what the problem the project solves
- The overall goal of this project was to complete an end-to-end data engineering project to gain exposure to technologies I have not used before. While this was a bit overwhelming at times, I would say it has been beneficial and pushed my comfort level. Now for a long vacation!. :)

- As for the data that was chosen; this was a moving target. The goal was to find something similar to the coursework so I could follow along with minimal re-engineering. I ended up landing on [CitiBike](https://citibikenyc.com/system-data) and [Divvy](https://citibikenyc.com/system-data) Bike TripData. I discovered that both of these data sources shared a common specification - [General Bikeshare Feed Specification](https://github.com/MobilityData/gbfs). This common specicification made it possible to ingest both sources and compare them with little additional lift. So that became the goal of this projec - compare CitiBike and Divvy Bike TripData.


# Cloud:
#### The project is developed in the cloud and IaC tools are used
- This project was developed on GCP. Terraform is as IaC  to build the infrastructure.
  - The variables.tf file with the terraform directory will need updated with the appropriate GCP configurations


# Data Ingestion:
#### End-to-end pipeline: multiple steps in the DAG, uploading data to data lake
- Batch / Kestra
- Kestra flows can be viewed in kestra/flows directory
- Primary ingestion occurs in Kestra using triggered flows. Once for citibike and one for divvy. These flows download the ZIP archive, decompress it, load it to Google Cloud Storage, and then run a merge to get that data loaded into BigQuery. 
- I later discovered the common General Bikeshare Feed Specification and learned there were additional JSON files available with station information and system regions. I tried including these in Kestra, but ultimately it proved to difficult complicated to ingest them that way. Those serparate JSON files were manually ingested with the shell scripts in the scripts directory. It was easier this way to leverage jq with the -r option to export these files to CSV to allow them to be ingested into Big Query. 


# Data Warehouse:
#### Tables are partitioned and clustered in a way that makes sense for the upstream queries (with explanation)
- Tables are initially partitioned by date. 


# Transformations:
#### Tranformations are defined with dbt, Spark or similar technologies
- Transformations are defined using dbt. See dbt/dbt_bike directory for all associated files.


# Dashboard:
- Looker Sudio was used to generate a dashboard
See CitiBike-vs-Divvy-Bike-Trips.pdf

(LookerStudio link)[https://lookerstudio.google.com/s/kVfelVfFYd4]

Reproducibility:
- Instructions are clear, it's easy to run the code, and the code works
