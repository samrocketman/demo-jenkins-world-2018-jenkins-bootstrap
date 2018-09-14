jenkinsfile_script = '''
pipeline_generator = buildViaJervis()

boolean allow_user_pipelines = true
if(hasGlobalVar('adminAllowUserPipelinesBoolean')) {
    allow_user_pipelines = adminAllowUserPipelinesBoolean() as boolean
}
if(!(pipeline_generator.generator.isPipelineJob() && allow_user_pipelines)) {
    return
}
adminJervisBuildNode(pipeline_generator, '') {
    stage("Prepare Jenkinsfile environment") {
        checkout scm
        String environment_string = sh(script: 'env | LC_ALL=C sort', returnStdout: true).split('\\n').join('\\n    ')
        echo "ENVIRONMENT:\\n    ${environment_string}"
    }
    load pipeline_generator.generator.jenkinsfile
}
'''
