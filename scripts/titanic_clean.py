import sys
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.utils import getResolvedOptions

args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Read from S3 raw bucket
input_df = spark.read.csv(
    "s3://chileshe-raw-data-2026/raw/titanic.csv",
    header=True,
    inferSchema=True
)

# Simple transformation
clean_df = input_df.dropna()

# Write to processed bucket
clean_df.write.mode("overwrite").parquet(
    "s3://chileshe-processed-data-2026/processed/titanic/"
)

job.commit()