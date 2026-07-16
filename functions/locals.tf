locals {
        # project_name = "${var.project_name}-${var.company_name}-${var.country}-${terraform.workspace}-rg"
        # alternate option to use of join() fn
        project_name = lower(join("-", [var.project_name, var.company_name, var.country, "${terraform.workspace}"]))

        account_replication_type = lookup(var.account_replication_type, var.environment, "dev")
}





