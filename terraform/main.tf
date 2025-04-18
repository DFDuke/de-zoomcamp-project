terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.27.0"
    }
  }
}

provider "google" {
  # Configuration options
  #   credentials = "/keys/my-creds.json"
  credentials = file(var.credentials)
  project = var.project
  region  = var.region
}


resource "google_storage_bucket" "divvy-bucket" {
  name          = var.gcs_divvy_bucket
  location      = var.location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_storage_bucket" "citibike-bucket" {
  name          = var.gcs_citibike_bucket
  location      = var.location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "divvy_dataset" {
  dataset_id = var.bq_divvy_dataset
  location   = var.location
}

resource "google_bigquery_dataset" "citibike_dataset" {
  dataset_id = var.bq_citibike_dataset
  location   = var.location
}