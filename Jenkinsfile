pipeline {
    agent any
    
    triggers {
        pollSCM('* * * * *') // Polls every minute (temporary for testing)
        // githubPush() // Uncomment after webhook setup
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
                subject: "Build ${currentBuild.result}: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
                Build triggered by commit: ${env.GIT_COMMIT}<br>
                Console output: ${env.BUILD_URL}console<br>
                <pre>${currentBuild.rawBuild.getLog(100).join("\n")}</pre>
                """,
                to: 'yuvabala355@gmail.com',
                mimeType: 'text/html'
            )
        }
    }
}
