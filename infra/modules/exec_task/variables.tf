variable "ecs_cluster_arn" {
  type = string
}

variable "task_name" {
  type = string
}

variable "ecr_image_arn" {
  type    = string
  default = "141864838114.dkr.ecr.ap-northeast-1.amazonaws.com/ecs-scheduled-batch:latest"
}
