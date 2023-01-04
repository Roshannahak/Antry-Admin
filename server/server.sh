#!/bin/sh

#set port
PORT=3232

# Stop any program currently running on the set port
echo 'preparing port' $PORT
fuser -k 3232/tcp

#switch directories
cd ./build/web/

#start the server
echo 'server starting on port '$PORT
python3 -m http.server $PORT
