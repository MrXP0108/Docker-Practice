$path = $MyInvocation.MyCommand.Path | Split-Path

docker container run --name apache `
    -d `
    -p 8080:80 `
    -v $path\data_mount\:/usr/local/apache2/htdocs/ `
httpd