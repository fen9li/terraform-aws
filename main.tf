provider "aws" {
  region                  = "ap-southeast-2"
  shared_credentials_file = "/Users/feng.li/.aws/credentials"
  profile                 = "dev"
}

resource "aws_instance" "c1-testing" {
  ami           = "ami-0c9d48b5db609ad6e"
  instance_type = "t2.micro"

  tags {
    Name = "c1-web"
  }
}
