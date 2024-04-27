# airflow-docker-setup

```
.
├── .env # Local environment variables
├── dags # Where your DAGs go
│   ├── example-dag-basic.py # Example DAG that showcases a simple ETL data pipeline
│   └── example-dag-advanced.py # Example DAG that showcases more advanced Airflow features, such as the TaskFlow API
├── Dockerfile # For the Astro Runtime Docker image, environment variables, and overrides
├── include # For any other files you'd like to include
├── plugins # For any custom or community Airflow plugins
│   └── example-plugin.py
├── tests # For any DAG unit test files to be run with pytest
│   └── test_dag_example.py # Test that checks for basic errors in your DAGs
├── airflow_settings.yaml # For your Airflow connections, variables and pools (local only)
├── packages.txt # For OS-level packages
└── requirements.txt # For Python packages
```
### Asto commands
- ``` astro dev init ```
- ``` astro dev start ```
- ```astro dev restart```
- ``` astro dev logs --scheduler ```
- ``` astro dev run <airflow-cli-commands> ```
  - eg. ``` astro dev run connections list```
- Reset your project: ```astro dev kill```
- To add-on to or change default docker-compose setup provided by astro - add `docker-compose.override.yml` file

### Astro documentation [here](https://docs.astronomer.io/astro/cli)