# Jenkins World 2018 Demo

<img
src="https://user-images.githubusercontent.com/875669/35621130-2acb1e78-0638-11e8-8777-0f56edc79c32.png"
height=48 width=48 alt="Jenkins CI logo" /> <img
src="https://user-images.githubusercontent.com/875669/35621286-b3d3b9b4-0638-11e8-956c-169993f8042e.png"
height=48 width=48 alt="Ubuntu Logo" /> <img
src="https://user-images.githubusercontent.com/875669/35621322-cf8ec752-0638-11e8-8dbc-72760b696d64.png"
height=48 width=48 alt="Red Hat Logo" /> <img
src="https://user-images.githubusercontent.com/875669/35621353-e78a6956-0638-11e8-8e07-3d96e9e91dd7.png"
height=48 width=72 alt="Docker Logo" /> <img
src="https://user-images.githubusercontent.com/875669/35621372-f72f6d16-0638-11e8-93d6-2ae335fc2382.png"
height=48 width=48 alt="Vagrant Logo" />

Welcome to [Sam Gleske's][github] [Jenkins World 2018 presentation][about]
technical demo.

- [Presentation slides][slides]
- [Screenshots of tech demo][demo] (prepared in case demo doesn't work)

# Presentation abstract

**Title:** Scaling developer onboarding in Fortune 50 and smaller organizations

This presentation is going to cover how a small CI/CD team can manage Jenkins
infrastructure to onboard thousands of engineers and reduce time to market as a
direct result.

Sections of the presentation:

- Eye Candy: The developer onboarding experience
- Jenkins development announcements
- Development workflow for delivering software at scale.
- Managing immutable infrastructure for Jenkins as a service within a large
  organization.
- Let's be real: what do I need to learn?
- Tech Demo: Show and tell a real workflow

# What does this repository represent?

This project provides the following functionality:

- A Jenkins server which can be bootstrapped using Docker and docker-compose.
  The server also is an agent and runs docker in docker to support ephemeral
  agents inside of the server docker container.
- A [Jenkins Pipeline Shared Global Library][pipeline-lib] which is meant to
  extend the [Jervis shared pipeline library][jervis].  See what Jervis provides
  in [`./jervis/vars/`](./jervis/vars/).
- Job DSL scripts which are extensions of the [Jervis job DSL scripts][jervis].
  See what Jervis provides in [`./jervis/jobs/`](./jervis/jobs/).
- An immutable infrastructure image for the server running in Docker.
- An immutable infrastructure image for the agent running in Docker.
- Configuration as code for a Jenkins server.

# Prerequisites

### Create secret-env.sh

Add `secret-env.sh` at the root of this repository with the following contents.

    export DEMO_GITHUB_USER=<github user>
    export DEMO_GITHUB_TOKEN=<github personal access token>
    export DEMO_UUID=$(uuidgen)

The [GitHub personal access token][github-pat] should have scopes `repo`,
`read:org`, and `user:email`.  In production I also add the `admin:repo_hook`
scope as well.  However, that's not necessary for the demo.

### System requirements

- If using Linux, [Docker][docker] and [docker-compose][compose] must be
  installed and running.
- If using Mac, [Vagrant][vagrant] and [VirtualBox][vbox] must be installed.
  Docker for mac is not stable enough to run this demo smoothly.  Refer to the
  [instructions for vagrant](docs/vagrant.md) instead of this README.

# Start Demo

Provision Jenkins with docker in docker.

    docker-compose up -d

Configure Jenkins.

    source secret-env.sh
    ./jenkins_bootstrap.sh

# Shell access

To gain shell access to the jenkins server including the docker in docker
environment.

    docker-compose exec -u jenkins jenkins /bin/bash

[about]: https://devopsworldjenkinsworld2018.sched.com/event/G4qY/scaling-developer-onboarding-in-fortune-50-and-smaller-organizations
[compose]: https://github.com/docker/compose/releases/
[demo]: ./presentation/tech-demo.pdf
[docker]: https://docs.docker.com/install/linux/docker-ce/centos/
[github-pat]: https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
[github]: https://github.com/samrocketman
[jervis]: https://github.com/samrocketman/jervis
[pipeline-lib]: https://jenkins.io/doc/book/pipeline/shared-libraries/
[slides]: ./presentation/jenkins-world-2018-scaling-developer-onboarding.pdf
[vagrant]: https://www.vagrantup.com/
[vbox]: https://www.virtualbox.org/wiki/Downloads
