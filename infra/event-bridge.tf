resource "aws_cloudwatch_event_target" "scheduled_batch" {
  target_id = "sample"
  arn       = aws_ecs_cluster.ecs_scheduled_batch.arn
  rule      = aws_cloudwatch_event_rule.scheduled_batch.name
  role_arn  = aws_iam_role.events_role.arn

  ecs_target {
    task_count             = 1
    task_definition_arn    = aws_ecs_task_definition.task_def.arn
    launch_type            = "FARGATE"
    platform_version       = "1.4.0"
    enable_execute_command = true
    network_configuration {
      subnets          = ["subnet-07ac474adb212ae1c"]
      security_groups  = ["sg-0b6a4493b12370ebb"]
      assign_public_ip = true
    }
  }

  input = jsonencode(
    {
      containerOverrides = [
        {
          name    = "sample",
          command = ["echo", "\"HelloWorld\""]
        }
      ]
    }
  )
}

resource "aws_cloudwatch_event_rule" "scheduled_batch" {
  name                = "sample-scheduled-batch"
  is_enabled          = true
  schedule_expression = "cron(* * * * ? *)"
}
