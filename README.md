# minepos-docker
NOTE: This image has not been tested in a production environment. 
A stable version of the upstream project (https://github.com/MinePoS/Backend) has not yet been released.

## WARNING
you shouldnt blindly trust random scripts you find.
make sure you understand what files i modify, and why i modify them (all in `build/`)
theres only 7 files there right now, its not too difficult to look (only 2 are longer than 20 lines)



## How to use:

1. make sure docker and docker-compose are installed.
2. clone this repository
3. change directory to repo and run `$ docker-compose up -d`
4. go to `http://localhost:8819`

to update to a new version of minepos, run `docker-compose up -d --build` or `$ docker-compose build && docker-compose up -d`



(admin username: `admin@minepos.net` password: `password`)

TODO:
* automatically build and publish an image when the upstream project is updated
* change some nginx and php settings to improve security
* make image more efficient (remove stuff needed to build but not run)
