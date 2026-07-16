locals {
    nsg_rule = {
        "allow_http" = { # "allow http" is the name of the rule and it is the key of the map
            priority = 100
            port = "80"
            access = "Allow"
            description = "Allow HTTP traffic"
        },
        "allow_https" = {
            priority = 200
            port = "443"
            access = "Allow"
            description = "Allow HTTPS traffic"
       }
    }
}