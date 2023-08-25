#! /bin/bash
source .env

# create a site folder user the $PROJECT_NAME
mkdir -p / ${PROJECT_NAME}-env
# move docker-compose to the $PROJECT_NAME folder
mv docker-compose.yml /${PROJECT_NAME}-env
# copy the .env to the $PROJECT_NAME folder
cp .env /${PROJECT_NAME}-env

#move to the new project folder
cd /$PROJECT_NAME

if [ 'MAC' === "$LOCAL_PLATFORM" ]; 
then
    # custom commands
else 
    # custom commands
fi

if [ 'APACHE' === "$SERVER_TYPE" ]; 
then
    # custom commands
else 
    # custom commands
fi

# run docker-compose
docker-compose up -d

# get and import database
# Not sure where we're getting this from Buddy?
# Use wp-cli to Import the database
# wp db import ${PROJECT_NAME}.sql
# Use wp-cli to find and replace the urls in the database
# wp cli db find-replace $SOURCE_DOMAIN $LOCAL_DOMAIN

# Remove the wp-content folder
rm -rf /wp-content
# Create a new wp-content folder
mkdir -p /wp-content
# move the orgignal repo content to the new folder
mv ../$PROJECT_NAME/* /wp-content

# move to the repo root folder
cd wp-content
# build out dependencies
composer  install
composer run build
# move to theme
cd themes/${PROJECT_NAME}/
# build out dependencies
npm install
composer install
npm run build
npm run watch

# set up uploads proxies
# maybe change the name of a file or put some content in the htaccess file?
