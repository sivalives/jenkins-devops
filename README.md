Dockerfile: It pulls the latest Jenkins image from Dockerhub; installs Ansible and maps the AWS server IP on the Jenkins URL. It also pre-installs a list of plugins defined in plugins.txt. 
docker-compose.yml - It Actually builds the Dockerfile for Jenkins and creates container for Docker in Docker ( DIND) 

How to Run : 
docker-compose up -d
