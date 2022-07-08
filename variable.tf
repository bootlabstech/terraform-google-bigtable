variable "bigtable_instance_name" {
  type        = string
  description = "The name of the Cloud Bigtable instance."
}

variable "project_id" {
  type        = string
  description = "The ID of the project in which the resource belongs."
}

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the instance"
}

variable "cluster_name" {
  type        = string
  description = "The name of cluster"
}

variable "storage_type" {
  type        = string
  description = "The storage type to use"
}

variable "zone" {
  type        = string
  description = "The zone to create the Cloud Bigtable cluster in the project"
}

variable "kms_key_name" {
  type        = string
  description = "Describes the Cloud KMS encryption key that will be used to protect the destination Bigtable cluster"
}

variable "number_of_cluster" {
  type        = number
  description = "The number of nodes in your Cloud Bigtable cluster"
}

variable "table_name" {
  type        = list(string)
  description = "The name of the table."
}

variable "enable_column_family" {
  type        = bool
  description = "A group of columns within a table which share a common configuration."
  default     = false
}

variable "family_name" {
  type        = string
  description = "The name of the column family"
}

variable "enable_app_profile" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "app_profile_id" {
  type        = string
  description = "The unique name of the app profile in the form [_a-zA-Z0-9][-_.a-zA-Z0-9]"
}

variable "multi_cluster_routing_use_any" {
  type        = bool
  description = "read/write requests are routed to the nearest cluster in the instance, and will fail over to the nearest cluster that is available in the event of transient errors or delays."
  default     = true
}

variable "ignore_warnings" {
  type        = bool
  description = "If true, ignore safety checks when deleting/updating the app profile."
  default     = true
}