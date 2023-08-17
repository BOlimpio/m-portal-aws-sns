# Terraform AWS SNS Topic Module

This Terraform module creates an Amazon SNS topic with various customizable options.

## Usage

To use this module, include the following code in your Terraform configuration:

```hcl
provider "aws" {
  region = "us-east-1"  # Replace with your desired region
}

module "sns_topic" {
  source            = "./meu-modulo-sns"  # Replace with the actual path or source URL
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

output "topic_arn" {
  value = module.sns_topic.topic_arn
}
```

## Inputs

| Name            | Description                         | Type   | Default |
|-----------------|-------------------------------------|--------|---------|
| name            | Name of the SNS topic               | string |         |
| display_name    | Display name for the SNS topic      | string | ""      |
| delivery_policy | Map representing the delivery policy for the topic | map | null |
| tags            | Tags to assign to the topic         | map    | {}      |

## Outputs

| Name        | Description                        |
|-------------|------------------------------------|
| topic_arn   | ARN of the created SNS topic       |
