terraform {
  required_version = "~> 0.11"

  backend "gcs" {
    bucket = "phoogle-gary-state-bucket"
    prefix = "state/iam/testapp-one"
  }
}

module "testapp-one-iam" {
  source     = "../../modules/testapp-one-iam"
  project_id = "simple-sample-project-f0cb"
}
