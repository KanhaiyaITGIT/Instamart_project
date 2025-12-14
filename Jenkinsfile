pipeline {
    agent any
    environment {
        PATH = "/opt/maven/bin"
    }

    stages {
        stage('git clone') {
            steps {
                echo "git cloning..."
                git url: "https://github.com/KanhaiyaITGIT/Instamart_project.git", branch: "main"
                echo "git cloned successfully"
            }
        }
        stage('code build') {
            steps {
                echo "code building.."
                sh "mvn clean install -Dmaven.test.skip=true"
                echo "code built successfully"
            }

            steps{
                echo "code test"
                sh "mvn test"
                echo "code test successfully"
            }
        }
        stage('code report generate') {
            steps {
                echo "generating report"
                sh "mvn surefire-report:report"
                echo "report generated successfully"
            }
        }
        stage('sonarqube analysis') {
            environment {
                sonarHome = tool 'sonar-scanner-server'
            }
            steps {
                echo "sonarqube analysis completed"
                withSonarQubeEnv('sonar-server') {
                    withCredentials([string(credentialsId: 'sonar-credentials', variable: 'SONAR_TOKEN')]) {
                        sh "${sonarHome}/bin/sonar-scanner -Dmaven.login=$SONAR_TOKEN"
                    }
                }
                echo "sonarqube analysis completed"
            }
        }
        stage('quality timeout') {
            steps {
                echo "quality gate"
                timeout(time: 4, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline:false
                }
            }
        }
    }
    post {
        success {
            echo "Pipeline executed successfully 🥳🥳🥳🥳"
        }
        failure {
            echo "Pipeline failed, Please check the logs 🫥😒😒⚠️⚠️"
        }
    }
}
