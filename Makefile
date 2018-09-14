IMAGE_VERSION := $(shell awk 'BEGIN {FS="="}; $$1 == "version" { print $$2; exit }' gradle.properties )
.PHONE: help docker dockerhub

help:
	@echo 'Run "make docker" to build docker images.'
	@echo 'Run "make dockerhub" to publish images.'

build/distributions/jenkins-bootstrap-$(IMAGE_VERSION).tar: dependencies.gradle custom-plugins.txt gradle.properties
	./gradlew clean buildTar

docker: build/distributions/jenkins-bootstrap-$(IMAGE_VERSION).tar
	docker build -t samrocketman/demo-jenkins-world-2018:jenkins-agent -f ./dockerfiles/Dockerfile.jenkins-agent .
	docker build -t samrocketman/demo-jenkins-world-2018:jenkins-server -f ./dockerfiles/Dockerfile.jenkins-server .

clean:
	docker rmi samrocketman/demo-jenkins-world-2018:jenkins-agent samrocketman/demo-jenkins-world-2018:jenkins-server

dockerhub: docker
	docker push samrocketman/demo-jenkins-world-2018:jenkins-server
	docker push samrocketman/demo-jenkins-world-2018:jenkins-agent
