sudo apt update -y
sudo apt upgrade -y
sudo apt install docker-compose -y

docker volume create statping-persistent-storage
docker volume ls
docker volume inspect statping-persistent-storage


#This will run docker headless but persistent

docker run -d -it -p 8080:8080 --mount source=statping-persistent-storage,target=/statping --name persistent-statping statping/statping

#Setup
curl http://x.x.x.x:8080/
#Dashboard
curl http://x.x.x.x:8080/login

#Stop the container
docker stop persistent-statping

#start the container
docker start persistent-statping
