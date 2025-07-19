pipeline {
    agent any
    
    triggers {
        pollSCM('* * * * *') // Temporary polling for testing
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
            script {
                // Safe way to get build log without getRawBuild()
                def log = currentBuild.rawBuild.getLog(100).join("\n")
                emailext (
                    subject: "Build ${currentBuild.result}: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                    body: """
                    <p>Build triggered by commit: ${env.GIT_COMMIT}</p>
                    <p>Console output: <a href="${env.BUILD_URL}console">${env.BUILD_URL}console</a></p>
                    <pre>${log}</pre>
                    """,
                    to: 'yuvabala355@gmail.com',
                    mimeType: 'text/html'
                )
            }
        }
    }
}
