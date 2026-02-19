# GitLab

## Introduction

GitLab is a web-based DevOps lifecycle tool that provides a Git repository manager providing wiki, issue-tracking, and CI/CD pipeline features.

## Installation

To install GitLab, run:

```bash
make install
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n gitlab
```

To access GitLab:

```bash
kubectl port-forward svc/gitlab-webservice-default 8080:8080 -n gitlab
```

Then open <http://localhost:8080> in your browser.

To get the initial root password:

```bash
kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -ojsonpath='{.data.password}' | base64 --decode
```

## Documentation

- [Official GitLab Documentation](https://docs.gitlab.com/)
- [Helm Chart Source](https://gitlab.com/gitlab-org/charts/gitlab)
