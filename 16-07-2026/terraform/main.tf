provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}

output "regions" {
  value = [
    "ap-south-1",
    "us-east-1"
  ]
}
