# Docker network
docker network create redminenet

# MariaDB
docker container run `
	--name mariadb -dit --net=redminenet -p 3307:3306 -p 33061:33060 `
	-e MYSQL_ROOT_PASSWORD=myrootpass `
	-e MYSQL_DATABASE=redminedb `
	-e MYSQL_USER=redmineuser `
	-e MYSQL_PASSWORD=mypass `
mariadb `
	--character-set-server=utf8mb4 `
	--collation-server=utf8mb4_unicode_ci `
	--default-authentication-plugin=mysql_native_password

# Redmine
docker container run `
	--name redmine -dit --net=redminenet -p 8086:3000 `
	-e REDMINE_DB_MYSQL=mariadb `
	-e REDMINE_DB_DATABASE=redminedb `
	-e REDMINE_DB_USERNAME=redmineuser `
	-e REDMINE_DB_PASSWORD=mypass `
redmine