resource "aws_cloudwatch_event_target" "scheduled_batch" {
  target_id = var.task_name
  arn       = var.ecs_cluster_arn
  rule      = aws_cloudwatch_event_rule.scheduled_batch.name
  role_arn  = aws_iam_role.events_role.arn

  ecs_target {
    task_count             = 1
    task_definition_arn    = aws_ecs_task_definition.task_def.arn
    launch_type            = "FARGATE"
    platform_version       = "1.4.0"
    enable_execute_command = true
    network_configuration {
      subnets         = ["subnet-07ac474adb212ae1c"]
      security_groups = ["sg-0b6a4493b12370ebb"]
    }
  }

  input = jsonencode(
    {
      containerOverrides = [
        {
          name    = var.task_name,
          command = var.command
        }
      ]
    }
  )
}

resource "aws_cloudwatch_event_rule" "scheduled_batch" {
  name                = var.task_name
  is_enabled          = true
  schedule_expression = var.schedule_expression
}
