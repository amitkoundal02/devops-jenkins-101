FROM jenkins/jenkins:2.414.2-jdk11
USER amit
sudo apt-get update && apt-get install -y lsb-release python3-pip
sudo curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
sudo echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
sudo apt-get update && apt-get install -y docker-ce-cli
USER jenkins
sudo jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"