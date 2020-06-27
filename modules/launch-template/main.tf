resource "aws_launch_template" "lt" {
  name = var.name
  iam_instance_profile {
    arn = var.iam_instance_profile
  }
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 100
    }
  }
  image_id = var.image_id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = var.user_data
  tags = var.tags
  tag_specifications {
    resource_type = "instance"
    tags = var.instance_tags
  }
  tag_specifications {
    resource_type = "volume"
    tags = var.volume_tags
  }
  lifecycle {
    prevent_destroy = false
  }
}