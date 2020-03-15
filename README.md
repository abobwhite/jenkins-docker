# Jenkins in Docker 
This is an example of running Jenkins in docker via docker compose. Copy the compose file to where you want to run Jenkins, change any values to your customizations, and run `docker-compose up -d`.

This Jenkins instance, by default:
* Is set for US Central timezone
* Pre-installs a set of plugins list in `plugins.txt`
* Comes installed with Docker CE and Docker Compose

### Customizing
If you'd like to customize the image itself (docker version, plugins list, etc), just make your changes and then run `docker build -t your-image-name .` and `docker push your-image-name`. Make sure to replace the jenkins image in `docker-compose.yml` to reflace `image: 'your-image-name'`

### Getting Plugins from Existing Jenkins
To get the list of plugins from an existing Jenkins instance, use the following where `$JENKINS_HOME` are your Jenkins credentials and address. The list will be output to a file `plugins.txt`.

```commandline
$JENKINS_HOME = username:password@jenkinshost.com:port
curl -sSL "http://$JENKINS_HOME/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/' > plugins.txt
```
