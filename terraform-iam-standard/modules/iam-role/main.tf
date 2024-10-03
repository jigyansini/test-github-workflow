resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy

  tags = var.tags
}

resource "aws_iam_role_policy" "this" {
  count  = length(var.inline_policies)
  name   = var.inline_policies[count.index].name
  policy = var.inline_policies[count.index].policy
  role   = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.managed_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = var.managed_policy_arns[count.index]
}
