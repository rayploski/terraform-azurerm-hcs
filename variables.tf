variable "accept_marketplace_aggrement" {
  type        = bool
  description = "Automatically accept the Legal Terms for the HCS for Azure marketplace image. To fully automate the deployment this needs to be true. However, if you want to manually accept it using the Azure Portal or you have already deployed a HCS for Azure cluster before this needs to be set to 'false'"
  default     = false
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that will host the managed application HCS for Azure. This must exist before applying the Terraform module."
}

variable "region" {
  type        = string
  description = "Choose the Azure region. As of April 29, 2020 only the regions East US (eastus), West US 2 (westus2), West Europe (westeurope) and North Europe (northeurope) are supported."
  default     = "westeurope"
}

variable "consul_cluster_mode" {
  type        = string
  description = "Non-production clusters have a limited feature set and only a single Consul server. Production clusters are fully supported, full featured, and deploy with a minimum of three hosts. Supported values are PRODUCTION and DEVELOPMENT."
  default     = "DEVELOPMENT"
}

# Wasn't used, saved for later.
# variable "number_of_servers" {
#   type        = number
#   description = "The number of Consul servers to provision."
#   default     = 1
# }

variable "application_name" {
  type        = string
  description = "Provide a name for your managed application. application_name can only contain letters and numbers, and be between 3 and 32 characters."
  # validation {
  #   condition     = length(var.application_name) >= 3 && length(var.application_name) <= 32 && can(regex("[A-Za-z0-9]+", var.application_name))
  #   error_message = "Application_name can only contain letters and numbers, and be between 3 and 32 characters."
  # }
}

variable "managed_resource_group_name" {
  type        = string
  description = "This resource group hols all the resources that are required by the managed application."
  default     = null
}

variable "consul_cluster_name" {
  type        = string
  description = "Provide a name for your new Consul cluster. Name must meet the following criteria: 3-25 characters long, start with a letter, end with a letter or number and contain only letters, numbers, and hyphens."
}

variable "consul_datacenter_name" {
  type        = string
  description = "Provide a data center name for your new Consul cluster. Name must meet the following criteria: 3-25 characters long, start with a letter, end with a letter or number and contain only letters, numbers, and hyphens."
  default     = "dc1"
}

variable "consul_version" {
  type        = string
  description = "Select a version of Consul. The only supported value as of April 29, 2020 is v1.7.2"
  default     = "v1.8.4"
}

variable "external_endpoint" {
  type        = bool
  description = "If enabled, the Consul UI and API will be exposed on a public IP address."
  default     = false
}

variable "vnet_starting_ip_address" {
  type        = string
  description = "Confiure the initial IP address for the VNET CIDR range of your Consul cluster. A prefix of /24 will be applied to the created VNET. VNET starting IP address must fall in the range of: 10.*.*.*, 172.[16-32].*.* or 192.168.*.*."
  default     = "172.25.16.0"
}

variable "hcs_marketplace_version" {
  type        = string
  description = "Version of the marketplace managed application. No need to change this unless this module is outdated or you know you need to use another version."
  default     = "0.0.47"
}

variable "hcs_base_url" {
  type        = string
  description = "URL of the HCS API. No need to change this unless this module is outdated or you know you need to use another version."
  default     = "https://ama-api.hashicorp.cloud/consulama/2020-07-24"
}

variable "email" {
  type        = string
  description = "This email will be used by HashiCorp to notify you about system updates and operational issues."
}
