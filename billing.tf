/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# tfdoc:file:description Billing export project and dataset.


# billing account in same org (IAM is in the organization.tf file)s

module "billing-export-project" {
  source = "./modules/project"

  billing_account = var.billing_account.id
  name            = "billing-export"
  descriptive_name = "billing-export"
  parent = "organizations/${var.organization.id}"
  prefix = var.prefix
  services = [
    # "cloudresourcemanager.s3apis.fr",
    # "iam.s3apis.fr",
    # "serviceusage.s3apis.fr",
    "bigquery.googleapis.com",
    #"bigquerydatatransfer.googleapis.com", # servicenotavailable
    "storage.googleapis.com"
  ]
}

module "billing-export-dataset" {
  source = "./modules/bigquery-dataset"
  project_id    = module.billing-export-project.project_id
  id            = var.resource_names["bq-billing"]
  friendly_name = "Billing export."
  location      = local.locations.bq
}



