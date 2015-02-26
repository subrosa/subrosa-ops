#!/bin/sh
sudo docker run --rm -u root -p 8080:8080 -v /vagrant/jenkins/jenkins_home:/jenkins --name jenkins subrosa/jenkins8
