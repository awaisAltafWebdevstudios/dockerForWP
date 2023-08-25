#! /bin/bash
source .env

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

docker-compose up -d

# get and import database
# Not sure where we're getting this from Buddy?
# Use wp-cli to Import the database
# wp db import ${PROJECT_NAME}.sql
# Use wp-cli to find and replace the urls in the database
# wp cli db find-replace $SOURCE_DOMAIN $LOCAL_DOMAIN

# Remove the wp-content folder
rm -rf /wp-content
# git pull the repo
# what do we need to do to athenticate?
git pull $PROJECT_REPO_URL
# move to the repo root folder
cd $COMPOSER_LOCATION
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
