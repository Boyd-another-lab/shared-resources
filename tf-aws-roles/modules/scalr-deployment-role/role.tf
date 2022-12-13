
resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_document.json

  #removes manually added inline policies
  inline_policy {}

   tags = {
     name    = var.role_name
     product = var.product
     service = var.service
     stage   = var.stage
   }

  # permissions_boundary = var.boundary_arn #need to add to var and role
}

resource "aws_iam_role_policy_attachment" "iam_attachment" {
  role       = aws_iam_role.role.id
  policy_arn = aws_iam_policy.iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "s3_attachment" {
  role       = aws_iam_role.role.id
  policy_arn = aws_iam_policy.s3_policy.arn
}
resource "aws_iam_role_policy_attachment" "cog_attachment" {
  role       = aws_iam_role.role.id
  policy_arn = aws_iam_policy.cog_policy.arn
}
