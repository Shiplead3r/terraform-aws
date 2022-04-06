provider "aws" {
    profile = var.profile
    region = var.master-regoin
    alias = "region-master"
}
provider "aws" {
    profile = var.profile
    region = var.workder-region
    alias  = "region-worker"
}