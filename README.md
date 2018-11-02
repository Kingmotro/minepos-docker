# minepos-docker
Docker image for [MinePoS](https://github.com/MinePoS/Backend) (a free and open source shop for game servers)

## WARNING
you shouldnt blindly trust random scripts you find.  
make sure you understand what files i modify, and why i modify them (all in `build/`)  
theres only 6 files there right now, its not too difficult to look (only 2 are longer than 20 lines)
(most of the setup happens are in `build/Dockerfile`)

NOTE: This image has not been tested in a production environment.  
A stable version of the upstream project (https://github.com/MinePoS/Backend) has not yet been released.


## How to use:

1. make sure docker and docker-compose are installed.
2. clone this repository
3. change directory to repo and run `$ docker-compose up -d`
4. go to `http://localhost:8819`

(admin username: `admin@minepos.net` password: `password`)

to update to a new version of minepos, run `docker-compose up -d --build` or `$ docker-compose build && docker-compose up -d`

## About this image.
This uses php 7 fpm as its base  
nginx has been installed (Apache is not supported by MinePoS)




TODO:
* automatically build and publish an image when the upstream project is updated
* change some nginx and php settings to improve security
* make image more efficient (remove stuff needed to build but not run)
* annotate / comment each line of all the files
* 
