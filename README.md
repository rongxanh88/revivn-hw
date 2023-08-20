# README

### Project Structure

This is a rails API app, with an internal folder /frontend which hosts a Next.js app. Running docker compose will bring up the minimum resources including postgres, rails, and
the frontend to complete the project requirements.

### Running locally
Assuming you have docker installed, run the following commands

1. `docker compose up` - This will start a postgres container along with the rails app.

2. If this is the first time you are running the app, you'll need to run the migrations.

Run `docker ps` and find the 'container_id' of the rails app. The name will be revivn-hw-app-1.
Run `docker exec -it {container_id} sh` to ssh into the container. You'll then be in the app working directory. Example command `docker exec -it ccbe1742a274 sh`
Run `rails db:create && rails db:migrate && rails db:seed`

3. Open a web browser, and navigate to `localhost:3050/equipment`. You should now see seeded equipment.
