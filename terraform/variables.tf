variable "credentials" {
  description = "My Credentials"
  default     = "./keys/de-zoomcamp-project-455400-f0fb28d30aea.json"
}


variable "project" {
  description = "Project"
  default     = "de-zoomcamp-project-455400"
}

variable "region" {
  description = "Region"
  default     = "us-east5"
}

variable "location" {
  description = "Project location"
  default     = "US"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}

variable "gcs_divvy_bucket" {
  description = "Divvy GCS Bucket"
  default     = " de-zoomcamp-project-455400-divvy-bucket"
}
variable "gcs_citibike_bucket" {
  description = "Citibike GCS Bucket"
  default     = " de-zoomcamp-project-455400-citibike-bucket"
}

variable "bq_divvy_dataset" {
  description = "Divvy BigQuery Dataset"
  default     = "divvy_dataset"
}

variable "bq_citibike_dataset" {
  description = "Citibike BigQuery Dataset"
  default     = "citibike_dataset"
}