# Create and start Apache container
docker container run --name apache -d -p 8080:80 httpd

# Copy index.html to the container
$path = $MyInvocation.MyCommand.Path | Split-Path
docker cp $path\data_from\index.html apache:/usr/local/apache2/htdocs/

# Copy index.html to the host
New-Item -Path $path -Name "data_to" -ItemType Directory
docker cp apache:/usr/local/apache2/htdocs/index.html $path\data_to\