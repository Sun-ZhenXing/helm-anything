HELM_RELEASE_NAME ?= opik
HELM_APPLICATION_NAME ?= opik
HELM_NAMESPACE ?= opik
HELM_DIR ?= ./helm
HELM_CHART_VERSION ?=
HELM_VALUES_FILE ?= ./values.yaml
HELM_OCI_REGISTRY ?=
HELM_OCI_NAMESPACE ?=
HELM_REPO_NAME ?= opik
HELM_REPO_URL ?= https://comet-ml.github.io/opik
HELM_CHART_REPO ?= $(HELM_REPO_NAME)/$(HELM_APPLICATION_NAME)

# Version for all Opik components
VERSION ?= latest

HELM_INSTALL_ARGS ?= \
  --set component.backend.image.tag=$(VERSION) \
  --set component.python-backend.image.tag=$(VERSION) \
  --set component.python-backend.env.PYTHON_CODE_EXECUTOR_IMAGE_TAG="$(VERSION)" \
  --set component.frontend.image.tag=$(VERSION)

include ../_template/base.mk
