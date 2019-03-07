terraform {
  required_version = "~> 0.11"

  backend "gcs" {
    bucket = "phoogle-gary-state-bucket"
    prefix = "iam-nonprod/projects/testapp_one"
  }
}

resource "google_service_account" "testapp-one-instance" {
  project      = "${var.project_id}"
  account_id   = "testapp-one-instance"
  display_name = "testapp-one-instance"
}

resource "google_project_iam_custom_role" "testapp_one_instance_role" {
  project = "${var.project_id}"
  role_id = "testapp_one_instance_role"
  title   = "testapp_one_instance_role"

  permissions = [
    "compute.instanceGroupManagers.get",
    "compute.instanceGroupManagers.list",
    "compute.instanceGroups.list",
    "compute.instances.attachDisk",
    "compute.instances.get",
    "compute.instances.list",
    "compute.targetInstances.list",
    "compute.zones.get",
    "compute.zones.list",
    "storage.objects.get",
    "storage.objects.list",
  ]
}

resource "google_project_iam_member" "testapp_one_instance_binding" {
  project = "${var.project_id}"
  role    = "${google_project_iam_custom_role.testapp_one_instance_role.id}"
  member  = "serviceAccount:${google_service_account.testapp-one-instance.email}"
}
