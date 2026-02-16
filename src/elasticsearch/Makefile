HELM_RELEASE_NAME ?= elasticsearch
HELM_APPLICATION_NAME ?= elasticsearch
HELM_NAMESPACE ?= elasticsearch
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?= 8.5.1
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?= docker.io
HELM_OCI_NAMESPACE ?=
HELM_REPO_NAME ?= elastic
HELM_REPO_URL ?= https://helm.elastic.co
HELM_CHART_REPO ?= $(HELM_REPO_NAME)/$(HELM_APPLICATION_NAME)
HELM_LANE ?=

include ../_template/base.mk
