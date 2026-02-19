# GitLab Runner

## Introduction

GitLab Runner is the open-source project that is used to run your jobs and send the results back to GitLab. It is used together with GitLab CI/CD, the open-source continuous integration service included with GitLab.

## Installation

To install GitLab Runner, run:

```bash
make install
```

## Configuration

Before installation, you need to configure the runner registration token in values.yaml:

```yaml
gitlabUrl: 'https://gitlab.example.com'
runnerRegistrationToken: YOUR_REGISTRATION_TOKEN
```

## Usage

After installation, verify the deployment:

```bash
kubectl get pods -n gitlab-runner
```

## Documentation

- [Official GitLab Runner Documentation](https://docs.gitlab.com/runner/)
- [Helm Chart Source](https://gitlab.com/gitlab-org/charts/gitlab-runner)
