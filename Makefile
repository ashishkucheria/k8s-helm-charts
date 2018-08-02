all: charts index

.PHONY: charts
charts:
	@helm package argus --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-helm-charts
	@helm package releasemanager --destination docs
	@helm repo index docs --url=https://logicmonitor.github.com/k8s-release-manager

index:
	helm repo index ./ --url https://logicmonitor.github.com/k8s-helm-charts
	mv index.yaml ./docs
