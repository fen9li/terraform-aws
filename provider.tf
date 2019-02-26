# provider.tf
provider "aws" {
  region                  = "ap-southeast-2"
  shared_credentials_file = "/Users/feng.li/.aws/credentials"
  profile                 = "dev"
}
