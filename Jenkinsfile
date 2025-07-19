pipeline {
    agent any
    
    triggers {
        pollSCM('H/5 * * * *') // Check every 5 minutes (temporary)
        // githubPush() // Uncomment after webhook is working
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'chmod +x hello.sh'
                sh './hello.sh'
            }
        }
    }
    
    post {
        always {
            emailext (
                subject: "Build ${currentBuild.currentResult}: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """<p>Build Status: <strong>${currentBuild.currentResult}</strong></p>
                       <p>Build URL: <a href="${env.BUILD_URL}">${env.BUILD_URL}</a></p>
                       <p>Commit: ${env.GIT_COMMIT ?: 'N/A'}</p>
                       <p>Triggered by: ${currentBuild.getBuildCauses()[0].shortDescription}</p>""",
                to: 'yuvabala355@gmail.com',
                mimeType: 'text/html'
            )
        }
    }
}
