resource "aws_glue_crawler" "titanic_crawler" {
  name          = "titanic-crawler"
  role          = aws_iam_role.glue_role.arn
  database_name = aws_glue_catalog_database.main.name

  s3_target {
    path = "s3://chileshe-raw-data-2026/raw/"
  }

  depends_on = [
    aws_iam_role_policy_attachment.glue_s3,
    aws_iam_role_policy_attachment.glue_service
  ]
}