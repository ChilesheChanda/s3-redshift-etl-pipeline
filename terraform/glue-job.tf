resource "aws_glue_job" "titanic_job" {
  name     = "titanic-etl-job"
  role_arn = aws_iam_role.glue_role.arn

  command {
    name            = "glueetl"
    script_location = "s3://chileshe-processed-data-2026/scripts/titanic_clean.py"
    python_version  = "3"
  }

  glue_version = "4.0"
  number_of_workers = 2
  worker_type       = "G.1X"

  depends_on = [
    aws_iam_role_policy_attachment.glue_s3,
    aws_iam_role_policy_attachment.glue_service
  ]
}