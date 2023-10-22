Dockerfile: It pulls the latest Jenkins image from Dockerhub; installs Ansible and maps the AWS server IP for Jenkins URL in the config. It also pre-installs a list of plugins defined in plugins.txt. 
docker-compose.yml - It Actually builds the Dockerfile for Jenkins and creates a container for Jenkins and Docker in Docker ( DIND) 

How to Run : 
docker-compose up -d
