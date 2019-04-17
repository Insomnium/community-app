#!/usr/bin/env bash

source .env

CUR_DIR=`pwd`

function terminate() {
	echo "$1"
	exit 1
}

MYSQL_IMAGE="dojorena/mysql:$DB_TAG"
DOJORENA_IMAGE="dojorena/app:$APP_TAG"

cd ..

if [[ "$(docker images -q $MYSQL_IMAGE 2> /dev/null)" != ""  ]]; then
	echo "MySQL tag $MYSQL_IMAGE already exists. Skipping..." 
else
	echo "Building $MYSQL_IMAGE image..."
	docker build -f "$CUR_DIR/Dockerfile-mysql" -t "$MYSQL_IMAGE" .
fi


if [[ "$(docker images -q $DOJORENA_IMAGE 2> /dev/null)" != ""  ]]; then
	echo "App tag $DOJORENA_IMAGE already exists. Skipping" 
else 
	echo "Building $DOJORENA_IMAGE image..."
	docker build -f "$CUR_DIR/Dockerfile-app" -t "$DOJORENA_IMAGE" .
fi

cd $CUR_DIR
echo "Done"

