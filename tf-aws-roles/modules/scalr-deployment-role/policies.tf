data "aws_iam_policy_document" "assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.scalr_trusted_role_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        var.external_id
      ]
    }
  }
}

resource "aws_iam_policy" "iam_policy" {
  name_prefix = "${var.role_name}-iam-policy"
  policy      = data.aws_iam_policy_document.iam_policy_document.json
}

data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    actions = [
      "iam:AttachRolePolicy",
      "iam:CreatePolicy",
      "iam:CreateRole",
      "iam:DeletePolicy",
      "iam:DeleteRole",
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:GetRole",
      "iam:ListAttachedRolePolicies",
      "iam:ListInstanceProfilesForRole",
      "iam:ListPolicyVersions",
      "iam:ListRolePolicies",
      "iam:TagRole",
      "iam:TagPolicy",
      "iam:DetachRolePolicy",
      "iam:AttachRolePolicy",
      "iam:CreatePolicyVersion",
      "iam:DeletePolicyVersion",
      "iam:PutRolePermissionsBoundary",
      "iam:UpdateAssumeRolePolicy",
      "iam:PassRole",
      "budgets:*"
    ]

    resources = [
      "*"
    ]
  }
}


resource "aws_iam_policy" "s3_policy" {
  name_prefix = "${var.role_name}-s3-policy"
  policy      = data.aws_iam_policy_document.s3_policy_document.json
}

data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:CreateBucket",
      "s3:ReadBucket",
      "s3:PutBucketWebsite",
      "s3:PutBucketPolicy",
      "s3:PutBucketAcl",
      "s3:PutBucketCORS",
      "s3:PutBucketVersioning",
      "s3:PutAccelerateConfiguration",
      "s3:PutBucketRequestPayment",
      "s3:PutBucketLogging",
      "s3:PutLifecycleConfiguration",
      "s3:PutReplicationConfiguration",
      "s3:PutEncryptionConfiguration",
      "s3:PutBucketObjectLockConfiguration",
      "s3:PutBucketTagging",
      "s3:PutObjectTagging",
      "s3:PutObjectVersionTagging",
      "s3:DeleteBucket",
      "s3:DeleteBucketPolicy",
      "s3:DeleteObjectTagging",
      "s3:DeleteObjectVersionTagging",
      "s3:DeleteBucketWebsite",
      "s3:ReplicateTags"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "cognito_policy" {
  name_prefix = "${var.role_name}-cog-policy"
  policy      = data.aws_iam_policy_document.cog_policy_document.json
}

data "aws_iam_policy_document" "cog_policy_document" {
  statement {
    actions = [
      "ses:VerifyDomainIdentity",
      "ses:GetIdentityMailFromDomainAttributes",
      "ses:GetIdentityVerificationAttributes",
      "ses:GetIdentityDkimAttributes",
      "cognito-idp:DescribeUserPool",
      "cognito-idp:DescribeUserPoolClient",
      "cognito-idp:CreateUserPool",
      "cognito-idp:DescribeUserPoolDomain",
      "cognito-idp:GetUserPoolMfaConfig",
      "cognito-idp:DeleteUserPool",
      "idp:DescribeUserPool"
    ]

    resources = [
      "*"
    ]
  }
}
