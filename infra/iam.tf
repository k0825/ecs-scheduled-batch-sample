resource "aws_iam_role" "ecs_role" {
  name               = "EcsTaskExecutionRole-sample"
  assume_role_policy = file("./policies/ecs-task-assume-role.json")
}

resource "aws_iam_policy" "ecs_task_execution_policy" {
  name   = "EcsTaskExecutionPolicy-sample"
  policy = file("./policies/ecs-task-execution-policy.json")
}

resource "aws_iam_role_policy_attachment" "task_execution_policy_attachment" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = aws_iam_policy.ecs_task_execution_policy.arn
}


resource "aws_iam_role" "events_role" {
  name               = "EcsEventsRole-sample"
  assume_role_policy = file("./policies/events-assume-role.json")
}

resource "aws_iam_policy" "events_policy" {
  name   = "EcsRunTaskEventsPolicy"
  policy = templatefile("./policies/events-policy.json", { task_definition_arn = aws_ecs_task_definition.task_def.arn })
}

resource "aws_iam_role_policy_attachment" "events_role_attachment" {
  role       = aws_iam_role.events_role.name
  policy_arn = aws_iam_policy.events_policy.arn
}
