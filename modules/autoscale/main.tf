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

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = var.launch_template
        version = "$Latest"
      }
      dynamic "override" {
        for_each = var.asg_mixed_instance_types
        content {
          instance_type = override.key
          #          weighted_capacity = override.value
        }
      }
    }
    instances_distribution {
      on_demand_base_capacity = "0"
      on_demand_allocation_strategy = "prioritized"
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
      spot_instance_pools = var.spot_instance_pools
      spot_allocation_strategy = var.spot_allocation_strategy
    }
  }
  lifecycle {
    ignore_changes = [target_group_arns]
    create_before_destroy = true
  }
}
