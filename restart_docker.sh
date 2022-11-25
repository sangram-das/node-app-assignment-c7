aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 020897777613.dkr.ecr.us-east-1.amazonaws.com
docker pull 020897777613.dkr.ecr.us-east-1.amazonaws.com/assignment-c7-916-app:latest
d=`docker ps | grep "0.0.0.0:8080->8080/tcp" | cut -d " " -f 1`
docker kill $d
docker run -d -p 8080:8080 020897777613.dkr.ecr.us-east-1.amazonaws.com/assignment-c7-916-app 
