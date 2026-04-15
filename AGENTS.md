# Helm Command Template Project Guidelines

## 1. Project Intent

The objective of this project is to provide a repository of pre-configured Helm command templates, enabling users to deploy various services quickly and consistently using a unified `make install` interface. The architecture relies on a "Template Method" pattern where a base Makefile in `src/_template` defines the core logic, and individual service directories in `src/` inherit and override specific variables. The primary challenge is ensuring that new services are based on the most popular and reliable upstream Helm Charts while maintaining a consistent user experience across different services.

## 2. Constraints

When contributing to or maintaining this project, you must adhere to the following rules:

* **Directory Structure & Inheritance:**
  * The core logic resides in `src/_template/Makefile`. Do not duplicate deployment logic in individual services.
  * Each service must be placed in its own directory under `src/` (e.g., `src/mysql/`, `src/redis/`).
  * The `Makefile` for a specific service must explicitly include the template (e.g., `include ../_template/Makefile`) and override necessary variables (Chart name, Repo URL, Version, custom flags).

* **Adding New Services:**
  * **Search First:** Before creating a new service, perform a web search to identify the most popular, well-maintained, and "de facto standard" Helm Chart for that specific software (e.g., Bitnami charts, official software charts).
  * **Configuration:** Include necessary configuration files (e.g., `values.yaml` overrides) within the service directory. The goal is "batteries included" but easily modifiable.
  * Always use English in `values.yaml` and `Makefile` for consistency, but provide Chinese documentation in `README.zh.md`.

* **Version Management:**
  * Use the `make versions` command (if available in the template) or manually check upstream to retrieve the latest stable version number.
  * Always update the `VERSION` or `TAG` variables in the service's Makefile when updating a service.

* **Documentation Standards:**
  * **Bilingual Requirement:** Every service directory **must** contain two documentation files:
    * `README.md`: English documentation.
    * `README.zh.md`: Chinese documentation.
  * **Content:** Both files must cover:
        1. **Introduction:** What the service is.
        2. **Installation:** How to use `make install`.
        3. **Usage:** Basic verification or connection steps.

* **Operator / Service Separation:**
  * **Operators and services MUST be in separate directories.** Never mix an operator deployment and its managed service/cluster in the same directory.
  * An operator-only directory should be named `<service>-operator/` (e.g., `mysql-operator/`, `cassandra-operator/`).
  * A service/cluster directory should use the plain service name (e.g., `mysql/`, `cassandra/`).
  * The operator directory's Makefile should only include `../_template/base.mk` and deploy the operator chart directly via the standard `install` target. Do **not** use `operator.mk` in either directory — `operator.mk` is deprecated for new services.
  * The service/cluster directory's README must state that the operator must be installed first, with a link to the operator directory (e.g., `See [mysql-operator](../mysql-operator/)`).
  * If a service is inherently operator-only with no separate cluster chart (e.g., Strimzi Kafka), the directory should still be named `<service>-operator/` and include any sample CRD manifests (e.g., `kafka-cluster.yaml`) for creating resources after the operator is installed.
  * When evaluating a new service that uses the operator pattern, search the upstream operator's GitHub repository and Helm chart registry to confirm the correct chart names and repo URLs for both the operator and the cluster/service charts.

* **Command Interface:**
  * The end-user interaction must remain simple. The primary entry point for any service is executing `make install` inside its directory.

## 3. Summary & Attention Points

* **User Experience:** The ultimate goal is simplicity. A user should not need to hunt for Helm flags; they should just run `make install` and get a sensible default deployment.
* **Source Quality:** Priority is given to official or widely trusted community Charts (Prohibited from using Bitnami) to ensure stability.
* **Localization:** Do not skip the Chinese documentation (`README.zh.md`); it is a strict requirement for this project.
* **Consistency:** Ensure all Makefiles follow the same variable naming convention defined in `src/_template` to prevent breaking the inheritance chain.
