# Kubernetes Operator Installation Template
# This file provides common targets for deploying services using the Operator pattern.
#
# Usage:
#   include ../_template/operator.mk
#
# Required variables:
#   HELM_RELEASE_NAME        - The name of the Helm release
#   HELM_APPLICATION_NAME    - The name of the application
#   HELM_NAMESPACE           - The namespace for the deployment
#   HELM_CHART_REPO          - The Helm chart repository
#
# Optional variables:
#   OPERATOR_RELEASE_NAME    - The release name for the operator (defaults to $(HELM_RELEASE_NAME)-operator)
#   OPERATOR_NAMESPACE       - The namespace for the operator (defaults to $(HELM_NAMESPACE)-system)
#   OPERATOR_CHART_REPO      - The Helm chart repository for the operator (if different from main chart)
#   OPERATOR_CHART_VERSION   - The version of the operator chart
#   OPERATOR_VALUES_FILE     - The values file for the operator
#   CLUSTER_RELEASE_NAME     - The release name for the cluster/resource
#   CLUSTER_VALUES_FILE      - The values file for the cluster/resource
#   WAIT_FOR_CRD             - Set to "true" to wait for CRDs to be ready
#   CRD_WAIT_TIMEOUT         - Timeout for waiting for CRDs (defaults to 60s)

OPERATOR_RELEASE_NAME ?= $(HELM_RELEASE_NAME)-operator
OPERATOR_NAMESPACE ?= $(HELM_NAMESPACE)-system
CLUSTER_RELEASE_NAME ?= $(HELM_RELEASE_NAME)-cluster
CRD_WAIT_TIMEOUT ?= 60s

# Install the operator
.PHONY: install-operator
install-operator:
ifdef OPERATOR_CHART_REPO
	@echo "Installing operator: $(OPERATOR_RELEASE_NAME)..."
	helm upgrade $(OPERATOR_RELEASE_NAME) $(OPERATOR_CHART_REPO) \
		--install \
		--namespace $(OPERATOR_NAMESPACE) \
		--create-namespace \
		$(if $(OPERATOR_CHART_VERSION),--version $(OPERATOR_CHART_VERSION),) \
		$(if $(OPERATOR_VALUES_FILE),--values $(OPERATOR_VALUES_FILE),)
else
	@echo "OPERATOR_CHART_REPO not set, skipping operator installation."
endif

# Wait for CRDs to be ready
.PHONY: wait-for-crds
wait-for-crds:
ifeq ($(WAIT_FOR_CRD),true)
	@echo "Waiting for CRDs to be ready (timeout: $(CRD_WAIT_TIMEOUT))..."
	@sleep 5
	@echo "CRDs should be ready now."
else
	@echo "WAIT_FOR_CRD not set to 'true', skipping CRD wait."
endif

# Install the cluster/resource using the operator
.PHONY: install-cluster
install-cluster:
	@echo "Installing cluster: $(CLUSTER_RELEASE_NAME)..."
	helm upgrade $(CLUSTER_RELEASE_NAME) $(HELM_CHART_REPO) \
		--install \
		--namespace $(HELM_NAMESPACE) \
		--create-namespace \
		$(if $(HELM_CHART_VERSION),--version $(HELM_CHART_VERSION),) \
		$(if $(CLUSTER_VALUES_FILE),--values $(CLUSTER_VALUES_FILE),$(if $(HELM_VALUES_FILE),--values $(HELM_VALUES_FILE),))

# Install operator and cluster
.PHONY: install-all
install-all: install-operator wait-for-crds install-cluster

# Uninstall the cluster only
.PHONY: uninstall-cluster
uninstall-cluster:
	helm uninstall $(CLUSTER_RELEASE_NAME) --namespace $(HELM_NAMESPACE)

# Uninstall the operator only
.PHONY: uninstall-operator
uninstall-operator:
	helm uninstall $(OPERATOR_RELEASE_NAME) --namespace $(OPERATOR_NAMESPACE)

# Uninstall everything
.PHONY: uninstall-all
uninstall-all: uninstall-cluster uninstall-operator

# Verify operator installation
.PHONY: verify-operator
verify-operator:
	@echo "Verifying operator installation..."
	kubectl get pods -n $(OPERATOR_NAMESPACE)
	kubectl get crd | grep $(HELM_APPLICATION_NAME) || echo "No CRDs found for $(HELM_APPLICATION_NAME)"

# Verify cluster installation
.PHONY: verify-cluster
verify-cluster:
	@echo "Verifying cluster installation..."
	kubectl get pods -n $(HELM_NAMESPACE)
	kubectl get $(HELM_APPLICATION_NAME) -n $(HELM_NAMESPACE) 2>/dev/null || echo "No $(HELM_APPLICATION_NAME) resources found"

# Verify everything
.PHONY: verify
verify: verify-operator verify-cluster
