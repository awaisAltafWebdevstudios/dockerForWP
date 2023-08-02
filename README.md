# dockerForWP
Docker file for WordPress setup.

# How to install WordPress

Run docker-compose up -d . 

This command will install everything for you. When done, go to http://localhost:8000, follow the installation process.

Docker configuration comes with WP CLI. To use it run:
docker-compose run --rm wpcli <your_command>

Above command is too long, create an alias: alias wp="docker-compose run --rm wpcli"

