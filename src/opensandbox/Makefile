HELM_RELEASE_NAME ?= opensandbox
HELM_APPLICATION_NAME ?= opensandbox-controller
HELM_NAMESPACE ?= opensandbox-system
HELM_CHART_VERSION ?= 0.1.0
HELM_VALUES_FILE ?= ./values.yaml
HELM_CHART_URL ?= https://github.com/alibaba/OpenSandbox/releases/download/helm/opensandbox-controller/$(HELM_CHART_VERSION)/opensandbox-controller-$(HELM_CHART_VERSION).tgz

.PHONY: install
install:
	@echo "Downloading OpenSandbox Helm Chart $(HELM_CHART_VERSION)..."
	@curl -sL $(HELM_CHART_URL) -o opensandbox-controller-$(HELM_CHART_VERSION).tgz
	@echo "Installing OpenSandbox..."
	@helm upgrade $(HELM_RELEASE_NAME) ./opensandbox-controller-$(HELM_CHART_VERSION).tgz \
		--install \
		--namespace $(HELM_NAMESPACE) \
		--create-namespace \
		--values $(HELM_VALUES_FILE) > output.log 2>&1 || (cat output.log && exit 1)
	@rm -f opensandbox-controller-$(HELM_CHART_VERSION).tgz
	@echo "OpenSandbox installed successfully!"

.PHONY: uninstall
uninstall:
	helm uninstall $(HELM_RELEASE_NAME) --namespace $(HELM_NAMESPACE)

.PHONY: values
values:
	@echo "Downloading OpenSandbox Helm Chart $(HELM_CHART_VERSION)..."
	@curl -sL $(HELM_CHART_URL) -o opensandbox-controller-$(HELM_CHART_VERSION).tgz
	@helm show values ./opensandbox-controller-$(HELM_CHART_VERSION).tgz > $(HELM_APPLICATION_NAME)-values.yaml
	@rm -f opensandbox-controller-$(HELM_CHART_VERSION).tgz
	@echo "Values saved to $(HELM_APPLICATION_NAME)-values.yaml"

.PHONY: watch
watch:
	bash -c "watch -n 0.5 kubectl get all -n $(HELM_NAMESPACE)"

.PHONY: logs
logs:
	kubectl logs -n $(HELM_NAMESPACE) -l app=$(HELM_APPLICATION_NAME) --tail=100 --follow
