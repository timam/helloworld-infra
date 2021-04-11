resource "aws_autoscaling_group" "asg" {
  name = var.name
  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired_capacity
  default_cooldown= "180"
  health_check_grace_period = "90"
  health_check_type = "ELB"
  force_delete = true
  termination_policies = ["OldestInstance", "OldestLaunchTemplate"]
  vpc_zone_identifier = var.vpc_zone_identifier
  enabled_metrics = [ "GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id = var.launch_template
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}
