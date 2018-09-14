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

This project provides the following functionality:

- A Jenkins master which can be bootstrapped using Docker and docker-compose.
  The master also serves as an agent and runs docker in docker to support
  ephemeral agents inside of the master docker container.
- A [Jenkins Pipeline Shared Global Library][pipeline-lib] which is meant to
  extend the [Jervis shared pipeline library][jervis].  See what Jervis provides
  in [`./jervis/vars/`](./jervis/vars/).
- Job DSL scripts which are extensions of the [Jervis job DSL scripts][jervis].
  See what Jervis provides in [`./jervis/jobs/`](./jervis/jobs/).
- An immutable infrastructure image for the master running in Docker.
- An immutable infrastructure image for the agent running in Docker.

# Start Jenkins

    docker-compose up -d

# Log into Jenkins master

To gain shell access to the jenkins master including the docker in docker
environment.

    docker-compose exec -u jenkins jenkins /bin/bash

[jervis]: https://github.com/samrocketman/jervis
[pipeline-lib]: https://jenkins.io/doc/book/pipeline/shared-libraries/
