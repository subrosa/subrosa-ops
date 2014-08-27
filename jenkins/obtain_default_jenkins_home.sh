sudo docker run --name jenkins jenkins &
id=$(sudo docker ps -ql)
sudo docker cp $id:/var/jenkins_home .
sudo docker kill jenkins
sudo docker rm jenkins

