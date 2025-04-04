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
  default     = "us-central1"
}

variable "location" {
  description = "Project location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My GCS Bucket Name"
  default     = "de-zoomcamp-project-455400-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}