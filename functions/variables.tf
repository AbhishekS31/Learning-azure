variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "project"
}
variable "company_name" {
  description = "The name of the company"
  type        = string
  default     = "Company"
}
variable "location" {
    description = "The location of the resources"   
    type        = string
    default     = "centralindia"
}
variable "country" {
    description = "The country of the resources"
    type        = string
    default     = "India"
}

variable "environment" {
    description = "The environment of the resources"
    type        = string
    default     = "test"
    validation {
        condition     = contains(["dev", "test", "prod"], var.environment)
        error_message = "Environment must be one of 'dev', 'test', or 'prod'."
    }
}


variable "account_replication_type" {
    description = "The replication type of the storage account"
    type        = map(string)
    default     = {
        dev= "LRS"
        test = "GRS"
        prod = "ZRS"
    }
}