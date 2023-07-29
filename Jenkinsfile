pipeline {
    agent any

    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/kbagwari035/django-notes-app.git", branch: "main"
            }
        }
        stage("Build"){
            steps {
                echo "Building the image"
                sh "docker build -t my-note-app ."
            }
        }
        stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker tag my-note-app ${env.dockerHubUser}/my-note-app:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/my-note-app:latest"
                }
            }
        }
        stage("Deploy on Kubernetes"){
            steps {
                echo "Deploying the container"
                sshagent(['K8s']) {
                sh "scp deployment.yml devops@192.168.56.115:"
                script{
                    try{
                        sh "ssh devops@192.168.56.115 kubectl apply -f deployment.yml"
                    }catch(error){
                        sh "ssh devops@192.168.56.115 kubectl apply -f deployment.yml"
                    }
                  }
                }
              }
            }
        }
    }
