resource "aws_ecs_cluster" "ecs_scheduled_batch" {
  name = "ecs-scheduled-batch-cluster"
}

resource "aws_ecs_task_definition" "task_def" {
  family                   = "ecs-scheduled-batch-task"
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode([{
    name   = "sample"
    image  = "141864838114.dkr.ecr.ap-northeast-1.amazonaws.com/ecs-scheduled-batch:latest"
    cpu    = 256
    memory = 512
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/ecs/fargate-task-definition"
        awslogs-region        = "ap-northeast-1"
        awslogs-stream-prefix = "ecs"
      }
    }
    essential = true
  }])
  execution_role_arn = aws_iam_role.ecs_role.arn
  task_role_arn      = aws_iam_role.ecs_role.arn

}
