# README

### Running locally
Assuming you have docker installed, run the following commands

1. `docker compose up` - This will start a postgres container along with the rails app.

2. If this is the first time you are running the app, you'll need to run the migrations.

Run `docker ps` and find the 'container_id' of the rails app. The name will be revivn-hw-app-1.
Run `docker exec -it {container_id} sh` to ssh into the container. You'll then be in the app working directory.
Run `rails db:create && rails db:migrate && rails db:seed`

Now you are ready.