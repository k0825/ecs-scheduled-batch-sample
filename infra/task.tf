module "task" {
  source = "./modules/task"

  task_name           = "sample"
  schedule_expression = "cron(*/30 * * * ? *)"
  command             = ["echo", "\"HelloWorld\""]
  ecs_cluster_arn     = aws_ecs_cluster.ecs_scheduled_batch.arn
}

module "exec_task" {
  source = "./modules/exec_task"

  task_name       = "exec-task"
  ecs_cluster_arn = aws_ecs_cluster.ecs_scheduled_batch.arn
}
