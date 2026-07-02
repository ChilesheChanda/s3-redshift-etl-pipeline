# AWS Glue Data Pipeline (Terraform)

## Overview

This project builds a simple end-to-end data engineering pipeline on AWS using Terraform.

It demonstrates how to:

- Store raw data in Amazon S3
- Use AWS Glue to catalogue and process data
- Run Spark-based transformations
- Output cleaned data back to S3
- Automate execution using scheduled triggers

---

## Architecture
Local CSV (Titanic dataset)
↓
S3 Raw Bucket
↓
Glue Crawler (schema discovery)
↓
Glue Data Catalog (metadata store)
↓
Glue ETL Job (Spark transformation)
↓
S3 Processed Bucket (Parquet output)
↓
Glue Trigger (daily schedule)


---

## Tech Stack

- AWS S3 (data storage)
- AWS Glue (ETL + data catalog + crawler)
- AWS IAM (permissions)
- AWS CloudWatch (logging)
- Terraform (Infrastructure as Code)
- Python (PySpark in Glue job)

---

## Dataset

This project uses the open-source Titanic dataset:

https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv

Columns include:

- PassengerId
- Survived
- Pclass
- Name
- Sex
- Age
- Fare

---

## Infrastructure (Terraform)

Terraform provisions:

- S3 bucket for raw data
- S3 bucket for processed data
- IAM role for AWS Glue
- Glue Data Catalog database
- Glue Crawler for schema detection
- Glue ETL Job for transformation
- Scheduled Glue Trigger (daily execution)

---

## ETL Process

### 1. Extract
Raw CSV is loaded into the S3 raw bucket.

### 2. Transform
Glue Spark job:
- Reads CSV from S3
- Removes null records (`dropna`)
- Applies basic cleaning

### 3. Load
Cleaned data is written back to S3 in Parquet format.

---

## Automation

The pipeline runs automatically once per day using a Glue scheduled trigger:


This runs the ETL job daily at 06:00 UTC.

---

## How to Run

### 1. Initialise Terraform
```bash
terraform init