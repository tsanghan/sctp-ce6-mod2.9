terraform {
  backend "s3" {
    bucket = "sctp-ce6-tfstate"
    key    = "tsanghan-ce6-mod2_9.tfstate"
    region = "ap-southeast-1"
  }
}
