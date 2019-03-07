terraform {
  required_version = "~> 0.11"

  backend "gcs" {
    bucket = "phoogle-gary-state-bucket"
    prefix = "state/iam/testapp-two"
  }
}

module "testapp-two-iam" {
  source     = "../../modules/testapp-two-iam"
  project_id = "simple-sample-project-f0cb"
}
