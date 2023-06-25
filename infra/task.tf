module "task" {
  source = "./modules/task"

  task_name           = "sample"
  schedule_expression = "cron(* * * * ? *)"
  command             = ["echo", "\"HelloWorld\""]
  ecs_cluster_arn     = aws_ecs_cluster.ecs_scheduled_batch.arn
}
