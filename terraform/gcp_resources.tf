resource "google_bigquery_dataset" "citibike_dataset" {
  access {
    role          = "OWNER"
    special_group = "projectOwners"
  }
  access {
    role          = "OWNER"
    user_by_email = "superuser@de-zoomcamp-project-455400.iam.gserviceaccount.com"
  }
  access {
    role          = "READER"
    special_group = "projectReaders"
  }
  access {
    role          = "WRITER"
    special_group = "projectWriters"
  }
  dataset_id                 = "citibike_dataset"
  delete_contents_on_destroy = false
  labels = {
    goog-terraform-provisioned = "true"
  }
  location              = "US"
  max_time_travel_hours = "168"
  project               = "de-zoomcamp-project-455400"
}
# terraform import google_bigquery_dataset.citibike_dataset projects/de-zoomcamp-project-455400/datasets/citibike_dataset
resource "google_project" "de_zoomcamp_project_455400" {
  auto_create_network = true
  billing_account     = "01C1FC-165751-84E57C"
  name                = "DE Zoomcamp Project"
  project_id          = "de-zoomcamp-project-455400"
}
# terraform import google_project.de_zoomcamp_project_455400 projects/de-zoomcamp-project-455400
resource "google_bigquery_table" "temp" {
  dataset_id = "citibike_dataset"
  project    = "de-zoomcamp-project-455400"
  schema     = "[{\"mode\":\"NULLABLE\",\"name\":\"recordid\",\"type\":\"INTEGER\"},{\"mode\":\"NULLABLE\",\"name\":\"column1\",\"type\":\"STRING\"},{\"mode\":\"NULLABLE\",\"name\":\"column2\",\"type\":\"STRING\"},{\"mode\":\"NULLABLE\",\"name\":\"column3\",\"type\":\"STRING\"}]"
  table_id   = "temp"
}
# terraform import google_bigquery_table.temp projects/de-zoomcamp-project-455400/datasets/citibike_dataset/tables/temp
resource "google_compute_firewall" "default_allow_icmp" {
  allow {
    protocol = "icmp"
  }
  description   = "Allow ICMP from anywhere"
  direction     = "INGRESS"
  name          = "default-allow-icmp"
  network       = "https://www.googleapis.com/compute/v1/projects/de-zoomcamp-project-455400/global/networks/default"
  priority      = 65534
  project       = "de-zoomcamp-project-455400"
  source_ranges = ["0.0.0.0/0"]
}
# terraform import google_compute_firewall.default_allow_icmp projects/de-zoomcamp-project-455400/global/firewalls/default-allow-icmp
resource "google_compute_firewall" "default_allow_internal" {
  allow {
    ports    = ["0-65535"]
    protocol = "tcp"
  }
  allow {
    ports    = ["0-65535"]
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }
  description   = "Allow internal traffic on the default network"
  direction     = "INGRESS"
  name          = "default-allow-internal"
  network       = "https://www.googleapis.com/compute/v1/projects/de-zoomcamp-project-455400/global/networks/default"
  priority      = 65534
  project       = "de-zoomcamp-project-455400"
  source_ranges = ["10.128.0.0/9"]
}
# terraform import google_compute_firewall.default_allow_internal projects/de-zoomcamp-project-455400/global/firewalls/default-allow-internal
resource "google_compute_firewall" "default_allow_rdp" {
  allow {
    ports    = ["3389"]
    protocol = "tcp"
  }
  description   = "Allow RDP from anywhere"
  direction     = "INGRESS"
  name          = "default-allow-rdp"
  network       = "https://www.googleapis.com/compute/v1/projects/de-zoomcamp-project-455400/global/networks/default"
  priority      = 65534
  project       = "de-zoomcamp-project-455400"
  source_ranges = ["0.0.0.0/0"]
}
# terraform import google_compute_firewall.default_allow_rdp projects/de-zoomcamp-project-455400/global/firewalls/default-allow-rdp
resource "google_compute_resource_policy" "default_schedule_1" {
  name    = "default-schedule-1"
  project = "de-zoomcamp-project-455400"
  region  = "us-east5"
  snapshot_schedule_policy {
    retention_policy {
      max_retention_days    = 14
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "10:00"
      }
    }
  }
}
# terraform import google_compute_resource_policy.default_schedule_1 projects/de-zoomcamp-project-455400/regions/us-east5/resourcePolicies/default-schedule-1
resource "google_compute_firewall" "default_allow_ssh" {
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  description   = "Allow SSH from anywhere"
  direction     = "INGRESS"
  name          = "default-allow-ssh"
  network       = "https://www.googleapis.com/compute/v1/projects/de-zoomcamp-project-455400/global/networks/default"
  priority      = 65534
  project       = "de-zoomcamp-project-455400"
  source_ranges = ["0.0.0.0/0"]
}
# terraform import google_compute_firewall.default_allow_ssh projects/de-zoomcamp-project-455400/global/firewalls/default-allow-ssh
resource "google_service_account" "compute_service_account" {
  account_id   = "compute-service-account"
  display_name = "Compute Service Account"
  project      = "de-zoomcamp-project-455400"
}
# terraform import google_service_account.compute_service_account projects/de-zoomcamp-project-455400/serviceAccounts/compute-service-account@de-zoomcamp-project-455400.iam.gserviceaccount.com
resource "google_logging_project_sink" "a_required" {
  destination            = "logging.googleapis.com/projects/de-zoomcamp-project-455400/locations/global/buckets/_Required"
  filter                 = "LOG_ID(\"cloudaudit.googleapis.com/activity\") OR LOG_ID(\"externalaudit.googleapis.com/activity\") OR LOG_ID(\"cloudaudit.googleapis.com/system_event\") OR LOG_ID(\"externalaudit.googleapis.com/system_event\") OR LOG_ID(\"cloudaudit.googleapis.com/access_transparency\") OR LOG_ID(\"externalaudit.googleapis.com/access_transparency\")"
  name                   = "_Required"
  project                = "514787838240"
  unique_writer_identity = true
}
# terraform import google_logging_project_sink.a_required 514787838240###_Required
resource "google_project_service" "bigquery_googleapis_com" {
  project = "514787838240"
  service = "bigquery.googleapis.com"
}
# terraform import google_project_service.bigquery_googleapis_com 514787838240/bigquery.googleapis.com
resource "google_project_service" "compute_googleapis_com" {
  project = "514787838240"
  service = "compute.googleapis.com"
}
# terraform import google_project_service.compute_googleapis_com 514787838240/compute.googleapis.com
resource "google_service_account" "cloudstorage_service_account" {
  account_id   = "cloudstorage-service-account"
  display_name = "CloudStorage Service Account"
  project      = "de-zoomcamp-project-455400"
}
# terraform import google_service_account.cloudstorage_service_account projects/de-zoomcamp-project-455400/serviceAccounts/cloudstorage-service-account@de-zoomcamp-project-455400.iam.gserviceaccount.com
resource "google_service_account" "superuser" {
  account_id   = "superuser"
  display_name = "SuperUser"
  project      = "de-zoomcamp-project-455400"
}
# terraform import google_service_account.superuser projects/de-zoomcamp-project-455400/serviceAccounts/superuser@de-zoomcamp-project-455400.iam.gserviceaccount.com
resource "google_project_service" "cloudapis_googleapis_com" {
  project = "514787838240"
  service = "cloudapis.googleapis.com"
}
# terraform import google_project_service.cloudapis_googleapis_com 514787838240/cloudapis.googleapis.com
resource "google_project_service" "dns_googleapis_com" {
  project = "514787838240"
  service = "dns.googleapis.com"
}
# terraform import google_project_service.dns_googleapis_com 514787838240/dns.googleapis.com
resource "google_project_service" "gkebackup_googleapis_com" {
  project = "514787838240"
  service = "gkebackup.googleapis.com"
}
# terraform import google_project_service.gkebackup_googleapis_com 514787838240/gkebackup.googleapis.com
resource "google_project_service" "storage_googleapis_com" {
  project = "514787838240"
  service = "storage.googleapis.com"
}
# terraform import google_project_service.storage_googleapis_com 514787838240/storage.googleapis.com
resource "google_project_service" "storage_component_googleapis_com" {
  project = "514787838240"
  service = "storage-component.googleapis.com"
}
# terraform import google_project_service.storage_component_googleapis_com 514787838240/storage-component.googleapis.com
resource "google_project_service" "servicemanagement_googleapis_com" {
  project = "514787838240"
  service = "servicemanagement.googleapis.com"
}
# terraform import google_project_service.servicemanagement_googleapis_com 514787838240/servicemanagement.googleapis.com
resource "google_service_account" "514787838240_compute" {
  account_id   = "514787838240-compute"
  display_name = "Compute Engine default service account"
  project      = "de-zoomcamp-project-455400"
}
# terraform import google_service_account.514787838240_compute projects/de-zoomcamp-project-455400/serviceAccounts/514787838240-compute@de-zoomcamp-project-455400.iam.gserviceaccount.com
resource "google_project_service" "monitoring_googleapis_com" {
  project = "514787838240"
  service = "monitoring.googleapis.com"
}
# terraform import google_project_service.monitoring_googleapis_com 514787838240/monitoring.googleapis.com
resource "google_storage_bucket" "de_zoomcamp_project_455400_divvy_bucket" {
  force_destroy               = false
  location                    = "US"
  name                        = "de-zoomcamp-project-455400-divvy-bucket"
  project                     = "de-zoomcamp-project-455400"
  public_access_prevention    = "enforced"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
# terraform import google_storage_bucket.de_zoomcamp_project_455400_divvy_bucket de-zoomcamp-project-455400-divvy-bucket
resource "google_project_service" "datastore_googleapis_com" {
  project = "514787838240"
  service = "datastore.googleapis.com"
}
# terraform import google_project_service.datastore_googleapis_com 514787838240/datastore.googleapis.com
resource "google_service_account" "bigquery_service_account" {
  account_id   = "bigquery-service-account"
  display_name = "BigQuery Service Account"
  project      = "de-zoomcamp-project-455400"
}
# terraform import google_service_account.bigquery_service_account projects/de-zoomcamp-project-455400/serviceAccounts/bigquery-service-account@de-zoomcamp-project-455400.iam.gserviceaccount.com
resource "google_project_service" "bigquerymigration_googleapis_com" {
  project = "514787838240"
  service = "bigquerymigration.googleapis.com"
}
# terraform import google_project_service.bigquerymigration_googleapis_com 514787838240/bigquerymigration.googleapis.com
resource "google_project_service" "sql_component_googleapis_com" {
  project = "514787838240"
  service = "sql-component.googleapis.com"
}
# terraform import google_project_service.sql_component_googleapis_com 514787838240/sql-component.googleapis.com
resource "google_project_service" "artifactregistry_googleapis_com" {
  project = "514787838240"
  service = "artifactregistry.googleapis.com"
}
# terraform import google_project_service.artifactregistry_googleapis_com 514787838240/artifactregistry.googleapis.com
resource "google_project_service" "cloudtrace_googleapis_com" {
  project = "514787838240"
  service = "cloudtrace.googleapis.com"
}
# terraform import google_project_service.cloudtrace_googleapis_com 514787838240/cloudtrace.googleapis.com
resource "google_project_service" "cloudasset_googleapis_com" {
  project = "514787838240"
  service = "cloudasset.googleapis.com"
}
# terraform import google_project_service.cloudasset_googleapis_com 514787838240/cloudasset.googleapis.com
resource "google_project_service" "bigquerystorage_googleapis_com" {
  project = "514787838240"
  service = "bigquerystorage.googleapis.com"
}
# terraform import google_project_service.bigquerystorage_googleapis_com 514787838240/bigquerystorage.googleapis.com
resource "google_project_service" "containerfilesystem_googleapis_com" {
  project = "514787838240"
  service = "containerfilesystem.googleapis.com"
}
# terraform import google_project_service.containerfilesystem_googleapis_com 514787838240/containerfilesystem.googleapis.com
resource "google_project_service" "containerregistry_googleapis_com" {
  project = "514787838240"
  service = "containerregistry.googleapis.com"
}
# terraform import google_project_service.containerregistry_googleapis_com 514787838240/containerregistry.googleapis.com
resource "google_project_service" "bigqueryreservation_googleapis_com" {
  project = "514787838240"
  service = "bigqueryreservation.googleapis.com"
}
# terraform import google_project_service.bigqueryreservation_googleapis_com 514787838240/bigqueryreservation.googleapis.com
resource "google_project_service" "container_googleapis_com" {
  project = "514787838240"
  service = "container.googleapis.com"
}
# terraform import google_project_service.container_googleapis_com 514787838240/container.googleapis.com
resource "google_project_service" "serviceusage_googleapis_com" {
  project = "514787838240"
  service = "serviceusage.googleapis.com"
}
# terraform import google_project_service.serviceusage_googleapis_com 514787838240/serviceusage.googleapis.com
resource "google_project_service" "bigqueryconnection_googleapis_com" {
  project = "514787838240"
  service = "bigqueryconnection.googleapis.com"
}
# terraform import google_project_service.bigqueryconnection_googleapis_com 514787838240/bigqueryconnection.googleapis.com
resource "google_logging_project_sink" "a_default" {
  destination            = "logging.googleapis.com/projects/de-zoomcamp-project-455400/locations/global/buckets/_Default"
  filter                 = "NOT LOG_ID(\"cloudaudit.googleapis.com/activity\") AND NOT LOG_ID(\"externalaudit.googleapis.com/activity\") AND NOT LOG_ID(\"cloudaudit.googleapis.com/system_event\") AND NOT LOG_ID(\"externalaudit.googleapis.com/system_event\") AND NOT LOG_ID(\"cloudaudit.googleapis.com/access_transparency\") AND NOT LOG_ID(\"externalaudit.googleapis.com/access_transparency\")"
  name                   = "_Default"
  project                = "514787838240"
  unique_writer_identity = true
}
# terraform import google_logging_project_sink.a_default 514787838240###_Default
resource "google_project_service" "dataform_googleapis_com" {
  project = "514787838240"
  service = "dataform.googleapis.com"
}
# terraform import google_project_service.dataform_googleapis_com 514787838240/dataform.googleapis.com
resource "google_project_service" "autoscaling_googleapis_com" {
  project = "514787838240"
  service = "autoscaling.googleapis.com"
}
# terraform import google_project_service.autoscaling_googleapis_com 514787838240/autoscaling.googleapis.com
resource "google_project_service" "osconfig_googleapis_com" {
  project = "514787838240"
  service = "osconfig.googleapis.com"
}
# terraform import google_project_service.osconfig_googleapis_com 514787838240/osconfig.googleapis.com
resource "google_project_service" "networkconnectivity_googleapis_com" {
  project = "514787838240"
  service = "networkconnectivity.googleapis.com"
}
# terraform import google_project_service.networkconnectivity_googleapis_com 514787838240/networkconnectivity.googleapis.com
resource "google_project_service" "iam_googleapis_com" {
  project = "514787838240"
  service = "iam.googleapis.com"
}
# terraform import google_project_service.iam_googleapis_com 514787838240/iam.googleapis.com
resource "google_project_service" "analyticshub_googleapis_com" {
  project = "514787838240"
  service = "analyticshub.googleapis.com"
}
# terraform import google_project_service.analyticshub_googleapis_com 514787838240/analyticshub.googleapis.com
resource "google_project_service" "bigquerydatapolicy_googleapis_com" {
  project = "514787838240"
  service = "bigquerydatapolicy.googleapis.com"
}
# terraform import google_project_service.bigquerydatapolicy_googleapis_com 514787838240/bigquerydatapolicy.googleapis.com
resource "google_project_service" "dataplex_googleapis_com" {
  project = "514787838240"
  service = "dataplex.googleapis.com"
}
# terraform import google_project_service.dataplex_googleapis_com 514787838240/dataplex.googleapis.com
resource "google_project_service" "pubsub_googleapis_com" {
  project = "514787838240"
  service = "pubsub.googleapis.com"
}
# terraform import google_project_service.pubsub_googleapis_com 514787838240/pubsub.googleapis.com
resource "google_project_service" "oslogin_googleapis_com" {
  project = "514787838240"
  service = "oslogin.googleapis.com"
}
# terraform import google_project_service.oslogin_googleapis_com 514787838240/oslogin.googleapis.com
resource "google_project_service" "iamcredentials_googleapis_com" {
  project = "514787838240"
  service = "iamcredentials.googleapis.com"
}
# terraform import google_project_service.iamcredentials_googleapis_com 514787838240/iamcredentials.googleapis.com
resource "google_project_service" "logging_googleapis_com" {
  project = "514787838240"
  service = "logging.googleapis.com"
}
# terraform import google_project_service.logging_googleapis_com 514787838240/logging.googleapis.com
resource "google_project_service" "storage_api_googleapis_com" {
  project = "514787838240"
  service = "storage-api.googleapis.com"
}
# terraform import google_project_service.storage_api_googleapis_com 514787838240/storage-api.googleapis.com
resource "google_storage_bucket" "de_zoomcamp_project_455400_citibike_bucket" {
  force_destroy = false
  labels = {
    goog-terraform-provisioned = "true"
  }
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age        = 3
      with_state = "ANY"
    }
  }
  lifecycle_rule {
    action {
      type = "AbortIncompleteMultipartUpload"
    }
    condition {
      age        = 1
      with_state = "ANY"
    }
  }
  location                 = "US"
  name                     = "de-zoomcamp-project-455400-citibike-bucket"
  project                  = "de-zoomcamp-project-455400"
  public_access_prevention = "inherited"
  storage_class            = "STANDARD"
}
# terraform import google_storage_bucket.de_zoomcamp_project_455400_citibike_bucket de-zoomcamp-project-455400-citibike-bucket
resource "google_project_service" "privilegedaccessmanager_googleapis_com" {
  project = "514787838240"
  service = "privilegedaccessmanager.googleapis.com"
}
# terraform import google_project_service.privilegedaccessmanager_googleapis_com 514787838240/privilegedaccessmanager.googleapis.com
