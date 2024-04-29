
from datetime import datetime, date
from airflow.decorators import dag
from airflow.providers.amazon.aws.operators.s3 import S3CreateBucketOperator
from airflow.models.baseoperator import chain

@dag(
    start_date=datetime(1970,1,1),
    schedule=None,
    catchup=False,
    tags=['seed'],
    template_searchpath='/usr/local/airflow/include',
)
def create_s3_bkt_dag():

    create_bucket = S3CreateBucketOperator(
        bucket_name='tests3cbucketlocalairflow',
        aws_conn_id="aws",
        region_name="ap-south-1",
        task_id="create_bucket_task"
    )
    chain(create_bucket)
create_s3_bkt_dag()