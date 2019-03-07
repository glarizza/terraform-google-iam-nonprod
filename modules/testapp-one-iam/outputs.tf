output "instance_sa_email" {
  value = "${google_service_account.testapp-one-instance.email}"
}
