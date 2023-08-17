resource "aws_sns_topic" "main" {
  name         = var.name
  display_name = var.display_name
  delivery_policy = var.delivery_policy

  tags = var.tags
}
