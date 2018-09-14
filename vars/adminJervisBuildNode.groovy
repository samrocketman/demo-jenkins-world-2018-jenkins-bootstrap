import net.gleske.jervis.lang.pipelineGenerator

def call(pipelineGenerator pipeline_generator, String label, Closure body) {
    node('master') {
        docker.image('samrocketman/demo-jenkins-world-2018:jenkins-agent').inside body
    }
}
