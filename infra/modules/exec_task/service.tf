
resource "aws_ecs_service" "service" {
  name                   = var.task_name
  cluster                = var.ecs_cluster_arn
  task_definition        = aws_ecs_task_definition.task_def.arn
  desired_count          = 1
  launch_type            = "FARGATE"
  enable_execute_command = true

  network_configuration {
    subnets          = ["subnet-07ac474adb212ae1c"]
    security_groups  = ["sg-0b6a4493b12370ebb"]
    assign_public_ip = true
  }
}
