# Create a new volume
docker volume create apachevol

# Run the container with volume mounted
docker container run --name apache `
    -d `
    -p 8080:80 `
    -v apachevol:/usr/local/apache2/htdocs/ `
httpd

$path = $MyInvocation.MyCommand.Path | Split-Path
New-Item -Path $path -Name "data_to" -ItemType Directory

# How to copy apachevol? Use a BusyBox container!
docker container run --rm `
    -v apachevol:/src/ `
    -v $path\data_to\:/dest/ `
busybox tar czvf /dest/backup.tar.gz -C /src .