# terraform-google-iam-nonprod

This repository represents and example layout for managing all things IAM on
Google Compute Platform with Terraform. The repository is laid out in the
following structure:

## The `modules` directory

This is where all Terraform modules for each project are created/stored. Each
module contains everything that needs to be managed for its respective
project, including:

* Service accounts
* Custom roles
* IAM bindings

It's recommended that unless you need the authoritative control provided by
the `google_*_iam_binding` resources that you use the
additive/non-authoritative `google_*_iam_member` resources instead. See
https://www.terraform.io/docs/providers/google/r/google_project_iam.html for
more details

## The `terraform` directory

This directory contains subfolders for each Terraform module declaration
that's defined within `main.tf`. That file contains the remote state
information (both the state bucket and the path within that bucket), as well
as the module declaration itself. Remote state is intentionally split out to
keep state small and separated, and Terraform needs to be run from each
folder on its own (i.e. there's no single point of entry).

## Terraform runs

Because each module declaration is intentionally separated, the act of running
Terraform against ALL modules must either be automated or enforced a folder
at a time.