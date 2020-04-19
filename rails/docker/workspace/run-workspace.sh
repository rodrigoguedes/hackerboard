### CLEAN
docker rm -f rails-workspace
# docker rmi rodrigoguedes/rails-environment:local -f

# ### DOCKER BUILD
# docker build -t rodrigoguedes/rails-workspace:local .

### DOCKER RUN
docker run -d \
  --name rails-workspace \
  -v /Users/rodrigo/projects/hackerboard/rails/src:/app \
	-it rodrigoguedes/rails-environment:local

docker exec -i -t rails-workspace bash:

#docker logs -f rails-workspace