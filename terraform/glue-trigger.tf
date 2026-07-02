resource "aws_glue_trigger" "daily_trigger" {
  name     = "titanic-daily-trigger"
  type     = "SCHEDULED"
  schedule = "cron(0 6 * * ? *)" # 06:00 UTC daily

  actions {
    job_name = aws_glue_job.titanic_job.name
  }
}