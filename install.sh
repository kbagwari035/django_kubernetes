sudo apt-get update -y
sudo apt-get install openjdk-17-jre -y
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y && sudo apt-get install jenkins -y
sudo apt-get install docker.io -y && sudo apt-get install docker-compose -y
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins
sudo newgrp docker
sudo init 6

