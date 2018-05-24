##############
#Provider SET#
##############

provider "aws" {
  access_key = "AKIAIIFDKHADQAUMAAYQ"
  secret_key = "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"
  region     = "us-east-1"
}

#######################
#Education declaration#
#######################

resource "aws_iam_role" "Engineering" {
  name = "Engineering"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {"AWS": "*"},
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#####################
#Finance declaration#
#####################

resource "aws_iam_role" "Finance" {
  name = "Finance"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {"AWS": "*"},
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

###################
#Initial atachment#
###################

resource "aws_iam_role_policy_attachment" "Finance-policy-attachment" {
  role       = "${aws_iam_role.Finance.name}"
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}
resource "aws_iam_role_policy_attachment" "Engineering-policy-attachment" {
  role       = "${aws_iam_role.Engineering.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

