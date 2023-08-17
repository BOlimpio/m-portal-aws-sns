provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

module "sns_topic" {
  source            = "./git-modulo-path"  # Replace with the actual path or source URL
  name              = "my-topic"
  display_name      = "My SNS Topic"
  delivery_policy   = {
    defaultHealthyRetryPolicy = {
      minDelayTarget = 20
      maxDelayTarget = 60
      numRetries = 3
      numNoDelayRetries = 0
      numMinDelayRetries = 0
      backoffFunction = "linear"
    }
  }
  tags = {
    Environment = "Production"
    AppVersion  = "1.0"
  }
}
