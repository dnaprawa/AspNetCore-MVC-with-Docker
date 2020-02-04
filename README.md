# ASP.NET Core MVC with Docker file

# How to run (without database)

####  1. Open cmd/bash and go to your project location
####  2. Type the following commands

```sh
$ docker build -t aspnetapp .
$ docker run -d -p 8080:80 --name myapp aspnetapp
```
####  3. Open any web browser and go to localhost:8080 to access your app.
