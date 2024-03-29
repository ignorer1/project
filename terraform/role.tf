resource "aws_iam_role" "role" {
  name               = "k8s-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}    
EOF
}
data "aws_iam_policy" "admin_access" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_role_policy_attachment" "admin-role-policy-attachment" {
  role       = aws_iam_role.role.name
  policy_arn = data.aws_iam_policy.admin_access.arn
}
resource "aws_iam_instance_profile" "profile" {
  name = "k8s-profile"
  role = aws_iam_role.role.name
}

