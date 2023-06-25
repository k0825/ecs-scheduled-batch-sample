resource "aws_ecs_task_definition" "task_def" {
  family                   = "ecs-scheduled-batch-task"
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  container_definitions = templatefile("${path.module}/container_def/container_def.tpl.json",
    {
      task_name = var.task_name
      image_arn = var.ecr_image_arn
  })
  execution_role_arn = aws_iam_role.ecs_role.arn
  task_role_arn      = aws_iam_role.ecs_role.arn

}
