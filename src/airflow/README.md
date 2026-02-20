# Apache Airflow

## Introduction

Apache Airflow is a platform to programmatically author, schedule, and monitor workflows. It uses directed acyclic graphs (DAGs) to manage workflow orchestration.

## Installation

To install Airflow, run:

```bash
make install
```

## Usage

After installation, access Airflow:

```bash
# Port forward to access web UI
kubectl port-forward svc/airflow-webserver -n airflow 8080:8080
```

Then open <http://localhost:8080> in your browser.

Default credentials:

- Username: `admin`
- Password: `admin`

## Configuration

The default configuration includes:

- CeleryExecutor for distributed task execution
- Built-in PostgreSQL for metadata database
- Built-in Redis for Celery broker
- Single replicas for webserver, scheduler, workers, and triggerer
- 10Gi for logs persistence

## Components

- **Webserver**: Serves the UI and API
- **Scheduler**: Schedules and triggers tasks
- **Workers**: Execute tasks (CeleryExecutor)
- **Triggerer**: Runs event-based triggers
- **Flower**: Celery monitoring tool

## Adding DAGs

To add your DAGs:

1. Enable `dags.gitSync` and configure your Git repository, OR
2. Mount a persistent volume with your DAG files, OR
3. Use the Airflow UI to upload DAG files (not recommended for production)

## Customization

- Edit `values.yaml` to configure connections, variables, and pools
- Scale workers by increasing `workers.replicas`
- Enable ingress for external access
