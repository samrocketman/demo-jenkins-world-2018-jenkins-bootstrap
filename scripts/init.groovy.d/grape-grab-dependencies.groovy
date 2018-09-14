// Work around race condition in grape @Grab by downloading pipeline
// dependencies during Jenkins startup sequence.
// ref: https://github.com/samrocketman/jenkins-bootstrap-jervis/issues/19
// ref: https://issues.jenkins-ci.org/browse/JENKINS-48974
// ref: https://issues.apache.org/jira/browse/GROOVY-7407
groovy.grape.Grape.grab(group:'net.gleske', module:'jervis', version:'1.2')
groovy.grape.Grape.grab(group:'org.yaml', module:'snakeyaml', version:'1.21')
