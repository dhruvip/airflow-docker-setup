# Import all packages needed at the top level of the DAG
from airflow.decorators import dag, task
from airflow.models.baseoperator import chain
from pendulum import datetime


# Define the DAG function a set of parameters
@dag(
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    catchup=False,
)
def taskflow_dag():
    # Define tasks within the DAG context
    @task
    def my_task_1():
        import time  # import packages only needed in the task function
        time.sleep(5)
        print(1)

    @task
    def my_task_2():
        print(2)

    # Define dependencies and call task functions
    chain(my_task_1(), my_task_2())

# Call the DAG function
taskflow_dag()
