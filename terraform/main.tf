resource "aws_s3_bucket" "raw" {
  bucket = "chileshe-raw-data-2026"
}

resource "aws_s3_bucket" "processed" {
  bucket = "chileshe-processed-data-2026"
}