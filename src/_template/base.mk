HELM_DIR ?= ./helm
HELM_CHART_VERSION ?=
HELM_OCI_REGISTRY ?=
HELM_OCI_NAMESPACE ?=
HELM_OCI_USERNAME ?=
HELM_OCI_PASSWORD ?=

LOGS_TAIL ?= 100

.PHONY: repo-add
repo-add:
ifdef HELM_REPO_NAME
	helm repo add $(HELM_REPO_NAME) $(HELM_REPO_URL)
	helm repo update
else
	@echo "NOTE: OCI helm registry do not require 'repo add', skipping this step."
endif
ifdef HELM_OCI_USERNAME
	helm registry login $(HELM_OCI_REGISTRY) -u $(HELM_OCI_USERNAME) -p $(HELM_OCI_PASSWORD)
else
	@echo "HELM_OCI_USERNAME is not set, skipping OCI registry login."
endif

.PHONY: install
install:
	helm upgrade $(HELM_RELEASE_NAME) $(HELM_CHART_REPO) \
		--install \
		--namespace $(HELM_NAMESPACE) \
		--create-namespace \
		$(if $(HELM_CHART_VERSION),--version $(HELM_CHART_VERSION),) \
		--values $(HELM_VALUES_FILE) > output.log 2>&1 || (cat output.log && exit 1) \
		$(if $(HELM_INSTALL_ARGS),$(HELM_INSTALL_ARGS),)

.PHONY: uninstall
uninstall:
	helm uninstall $(HELM_RELEASE_NAME) --namespace $(HELM_NAMESPACE)

.PHONY: values
values:
	helm show values $(HELM_CHART_REPO) \
	$(if $(HELM_CHART_VERSION),--version $(HELM_CHART_VERSION),) \
	> $(HELM_APPLICATION_NAME)-values.yaml

.PHONY: versions
versions:
ifdef HELM_OCI_REGISTRY
	@echo "Fetching versions from OCI registry..."
	@bash -c "if [ -n '$(HELM_OCI_USERNAME)' ]; then \
		curl -s -u $(HELM_OCI_USERNAME):\$$(echo '$(HELM_OCI_PASSWORD)') https://$(HELM_OCI_REGISTRY)/v2/$(HELM_OCI_NAMESPACE)/$(HELM_APPLICATION_NAME)/tags/list; \
	else \
		curl -s https://$(HELM_OCI_REGISTRY)/v2/$(HELM_OCI_NAMESPACE)/$(HELM_APPLICATION_NAME)/tags/list; \
	fi | jq -r '.tags[]' | grep -v '^sha256' | sort -V" || (echo "Failed to fetch versions from OCI registry." && exit 1)
else
	@echo "Fetching versions from Helm repository..."
	helm search repo $(HELM_CHART_REPO) --versions
endif

.PHONY: watch
watch:
	bash -c "watch -n 0.5 kubectl get all -n $(HELM_NAMESPACE)"

.PHONY: helm-push
helm-push:
	@if [ -d "$(HELM_DIR)" ]; then \
		helm lint $(HELM_DIR)/$(HELM_APPLICATION_NAME); \
		helm package $(HELM_DIR)/$(HELM_APPLICATION_NAME); \
		helm push $$(ls $(HELM_APPLICATION_NAME)-*.tgz) oci://$(HELM_OCI_REGISTRY)/$(HELM_OCI_NAMESPACE); \
		rm -f $(HELM_APPLICATION_NAME)-*.tgz; \
		echo "NOTE: Helm chart uploaded successfully!"; \
	else \
		echo "HELM_DIR '$(HELM_DIR)' does not exist. Skipping helm-push."; \
	fi

.PHONY: logs
logs:
	kubectl logs -n $(HELM_NAMESPACE) -l app=$(HELM_APPLICATION_NAME) --tail=$(LOGS_TAIL) --follow
