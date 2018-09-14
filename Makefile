IMAGE_VERSION := $(shell awk 'BEGIN {FS="="}; $$1 == "version" { print $$2; exit }' gradle.properties )
.PHONE: help docker dockerhub

help:
	@echo 'Run "make docker" to build docker images.'
	@echo 'Run "make dockerhub" to publish images.'
	@echo "Gradle version: $(IMAGE_VERSION)"

build/distributions/jenkins-bootstrap-$(IMAGE_VERSION).tar: dependencies.gradle custom-plugins.txt gradle.properties
	./gradlew clean buildTar

dockerfiles/Dockerfile.jenkins-server: build/distributions/jenkins-bootstrap-$(IMAGE_VERSION).tar
	docker build -t samrocketman/demo-jenkins-world-2018:jenkins-server -f ./dockerfiles/Dockerfile.jenkins-server .

dockerfiles/Dockerfile.jenkins-agent: build/distributions/jenkins-bootstrap-$(IMAGE_VERSION).tar
	docker build -t samrocketman/demo-jenkins-world-2018:jenkins-agent -f ./dockerfiles/Dockerfile.jenkins-agent .


docker: dockerfiles/Dockerfile.jenkins-server dockerfiles/Dockerfile.jenkins-agent

dockerhub: docker
	docker push samrocketman/demo-jenkins-world-2018:jenkins-server
	docker push samrocketman/demo-jenkins-world-2018:jenkins-agent
