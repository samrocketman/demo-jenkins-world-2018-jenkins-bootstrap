#!/bin/bash

#
# CHECKS
#

function die() {
  echo "ERROR: ${*}" >&2
  exit 1
}

if [[ \
    -z "${DEMO_GITHUB_USER}" || \
    -z "${DEMO_GITHUB_TOKEN}" || \
    -z "${DEMO_UUID}"
    ]]; then

    cat <<'EOF'
ERROR: missing one of the required environment variables.
    DEMO_GITHUB_TOKEN
    DEMO_GITHUB_USER
    DEMO_UUID
EOF
  exit 1
fi

type -P docker || die "Docker is not installed."
type -P docker-compose || die "Missing docker-compose command from PATH."
type -P envsubst || die "Missing gettext package which provides envsubst command."
test -d .git || die "${0##*/} must be run from the root of this repository."

#
# CONFIGURE JENKINS
#

export DOCKER_JENKINS=1
source jenkins-bootstrap-shared/jenkins_bootstrap.sh

# create jobs and views
create_job --job-name '_jervis_generator' --xml-data './configs/job_jervis_config.xml'
create_view --view-name 'Welcome' --xml-data './configs/view_welcome_config.xml'
create_view --view-name 'GitHub Organizations' --xml-data "./configs/view_github_organizations_config.xml"
jenkins_console --script "${SCRIPT_LIBRARY_PATH}/configure-primary-view.groovy"
jenkins_console -s './scripts/admin-script-approval.groovy'

# configure misc Jenkins settings
jenkins_console -s "${SCRIPT_LIBRARY_PATH}/configure-markup-formatter.groovy"
jenkins_console -s "${SCRIPT_LIBRARY_PATH}/configure-job-dsl-security.groovy"
jenkins_console -s "${SCRIPT_LIBRARY_PATH}/configure-jnlp-agent-protocols.groovy"
jenkins_console -s "${SCRIPT_LIBRARY_PATH}/configure-grape-ivy-xml.groovy"

# configure default Jenkinsfile which runs for all projects
jenkins_console -s ./configs/global-jenkinsfile.groovy -s "${SCRIPT_LIBRARY_PATH}/configure-global-jenkinsfile.groovy"

# configure credentials
envsubst > ./configs/credentials.groovy < ./configs/credentials.groovy.EXAMPLE
jenkins_console -s ./configs/credentials.groovy -s "${SCRIPT_LIBRARY_PATH}"/credentials-multitype.groovy
