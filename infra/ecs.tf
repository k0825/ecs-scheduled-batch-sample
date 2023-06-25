resource "aws_ecs_cluster" "ecs_scheduled_batch" {
  name = "ecs-scheduled-batch-cluster"
}

# resource "aws_ecs_capacity_provider" "capacity_provider" {
#   cluster_name       = aws_ecs_cluster.ecs_scheduled_batch.name
#   capacity_providers = ["FARGATE"]

#   default_capacity_provider_strategy {
#     base              = 1
#     weight            = 100
#     capacity_provider = "FARGATE"
#   }
# }
