resource "aws_iam_role" "ecs_role" {
  name               = "EcsTaskExecutionRole-exec"
  assume_role_policy = file("${path.module}/policies/ecs-task-assume-role.json")
}

resource "aws_iam_policy" "ecs_task_execution_policy" {
  name   = "EcsTaskExecutionPolicy-sample-exec"
  policy = file("${path.module}/policies/ecs-task-execution-policy.json")
}

resource "aws_iam_role_policy_attachment" "task_execution_policy_attachment" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = aws_iam_policy.ecs_task_execution_policy.arn
}
