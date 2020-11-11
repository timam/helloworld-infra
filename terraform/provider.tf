terraform {
  backend "s3" {
    bucket         = "tfstate-helloworld"
    key            = "keyfiles"
    region         = "ap-southeast-1"
    dynamodb_table = "tfstate-helloworld"
  }
}