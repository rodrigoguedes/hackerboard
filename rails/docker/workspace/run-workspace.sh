### CLEAN
docker rm -f rails-workspace
# docker rmi rodrigoguedes/rails-environment:local -f

# ### DOCKER BUILD
# docker build -t rodrigoguedes/rails-workspace:local .

### DOCKER RUN
docker run -d \
  --name rails-workspace \
  -p 3000:3000 \
  -v /Users/rodrigo/projects/hackerboard/rails/src:/app \
	-it rodrigoguedes/rails-environment:ruby_2.7.1-rails_6.0.2.2-1.1
  

docker exec -i -t rails-workspace bash

#docker logs -f rails-workspace