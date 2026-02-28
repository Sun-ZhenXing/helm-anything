# Gateway Service Installation Template
# This file provides common targets for deploying Gateway API based services.
# It extends crd.mk with Gateway-specific verification and utilities.
#
# Usage:
#   include ../_template/crd.mk
#   include ../_template/gateway.mk
#
# Required variables (inherited from crd.mk):
#   HELM_RELEASE_NAME        - The name of the Helm release
#   HELM_NAMESPACE           - The namespace for the deployment
#   HELM_CHART_VERSION       - The version of the Helm chart
#
# Additional required variables:
#   GATEWAY_CLASS_NAME       - The name of the GatewayClass (e.g., "kgateway", "agentgateway")
#   CRD_HELM_CHART_REPO      - The Helm chart repository for CRDs
#
# Optional variables:
#   GATEWAY_API_VERSION      - Version of Gateway API (defaults to v1.4.0)
#   ENABLE_GATEWAY_VERIFY    - Set to "true" to enable gateway verification (defaults to true)

GATEWAY_API_VERSION ?= v1.4.0
ENABLE_GATEWAY_VERIFY ?= true

# Verify GatewayClass installation
.PHONY: verify-gatewayclass
verify-gatewayclass:
ifeq ($(ENABLE_GATEWAY_VERIFY),true)
	@echo "Verifying GatewayClass: $(GATEWAY_CLASS_NAME)..."
	kubectl get gatewayclass $(GATEWAY_CLASS_NAME) || echo "GatewayClass $(GATEWAY_CLASS_NAME) not found"
else
	@echo "Gateway verification disabled."
endif

# Verify Gateway installation
.PHONY: verify-gateway
verify-gateway:
ifeq ($(ENABLE_GATEWAY_VERIFY),true)
	@echo "Verifying Gateways in namespace: $(HELM_NAMESPACE)..."
	kubectl get gateway -n $(HELM_NAMESPACE) 2>/dev/null || echo "No Gateways found in $(HELM_NAMESPACE)"
else
	@echo "Gateway verification disabled."
endif

# Verify HTTPRoutes
.PHONY: verify-httproutes
verify-httproutes:
ifeq ($(ENABLE_GATEWAY_VERIFY),true)
	@echo "Verifying HTTPRoutes in namespace: $(HELM_NAMESPACE)..."
	kubectl get httproute -n $(HELM_NAMESPACE) 2>/dev/null || echo "No HTTPRoutes found in $(HELM_NAMESPACE)"
else
	@echo "Gateway verification disabled."
endif

# Full verification including Gateway API resources
.PHONY: verify-gateway-all
verify-gateway-all: verify-crds verify-gatewayclass verify-gateway verify-httproutes
	@echo "Gateway verification complete."

# Override the verify target from crd.mk to include gateway verification
.PHONY: verify
verify: verify-crds verify-gatewayclass
ifeq ($(ENABLE_GATEWAY_VERIFY),true)
	@echo "Verifying $(HELM_APPLICATION_NAME) installation..."
	kubectl get pods -n $(HELM_NAMESPACE)
	kubectl get gatewayclass $(GATEWAY_CLASS_NAME) 2>/dev/null || echo "GatewayClass $(GATEWAY_CLASS_NAME) not ready yet"
endif

# Port forward to the gateway service
.PHONY: port-forward-gateway
port-forward-gateway:
	@echo "Port forwarding to gateway service..."
	@POD_NAME=$$(kubectl get pods -n $(HELM_NAMESPACE) -l app=$(HELM_APPLICATION_NAME) -o jsonpath='{.items[0].metadata.name}' 2>/dev/null); \
	if [ -n "$$POD_NAME" ]; then \
		echo "Forwarding to pod: $$POD_NAME"; \
		kubectl port-forward -n $(HELM_NAMESPACE) $$POD_NAME 8080:8080; \
	else \
		echo "No gateway pod found with label app=$(HELM_APPLICATION_NAME)"; \
	fi

# Get gateway status
.PHONY: gateway-status
gateway-status:
	@echo "GatewayClass status:"
	kubectl get gatewayclass $(GATEWAY_CLASS_NAME) -o yaml 2>/dev/null || echo "GatewayClass not found"
	@echo ""
	@echo "Gateways in $(HELM_NAMESPACE):"
	kubectl get gateway -n $(HELM_NAMESPACE) -o yaml 2>/dev/null || echo "No Gateways found"
