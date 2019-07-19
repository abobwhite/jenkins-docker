# Jenkins in Docker 
This is an example of running Jenkins in docker via docker compose. Copy the compose file to where you want to run Jenkins, change any values to your customizations, and run `docker-compose up -d`.

This Jenkins instance, by default:
* Is set for US Central timezone
* Pre-installs a set of plugins list in `plugins.txt`
* Comes installed with Docker CE and Docker Compose

If you'd like to customize the image itself (docker version, plugins list, etc), just make your changes and then run `docker build -t your-image-name .`