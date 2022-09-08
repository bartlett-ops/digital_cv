provider "aws" {
  region  = "eu-west-1"
  profile = "bartlett"
}

provider "aws" {
  alias   = "us_east_1"
  region  = "us-east-1"
  profile = "bartlett"
}
