# Docker network
docker network create wpnet

# MySQL
docker container run `
	--name mysql -dit --net=wpnet -p 3307:3306 -p 33061:33060 `
	-e MYSQL_ROOT_PASSWORD=myrootpass `
	-e MYSQL_DATABASE=wpdb `
	-e MYSQL_USER=wpuser `
	-e MYSQL_PASSWORD=mypass `
mysql `
	--character-set-server=utf8mb4 `
	--collation-server=utf8mb4_unicode_ci `
	--default-authentication-plugin=mysql_native_password

# WordPress
docker container run `
	--name wp -dit --net=wpnet -p 8085:80 `
	-e WORDPRESS_DB_HOST=mysql `
	-e WORDPRESS_DB_NAME=wpdb `
	-e WORDPRESS_DB_USER=wpuser `
	-e WORDPRESS_DB_PASSWORD=mypass `
wordpress