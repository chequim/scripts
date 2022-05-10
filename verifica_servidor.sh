#!/bin/bash
set -x
http_code=$(curl --write-out %{http_code} --silent --output /dev/null https://shielded-falls-94429.herokuapp.com/)

if [ $http_code -ne 200 ];then
    echo "$(date +%F\ %T) Heroku is down! http_code = $http_code" >> /home/chequim/workspace/scripts/logs/verifica_servidor.log
    echo "$(date +%F\ %T) Scale up Heroku ..." >> /home/chequim/workspace/scripts/logs/verifica_servidor.log
    cd /home/chequim/workspace/repos/node-js-getting-started
    heroku ps:scale web=1
else
    echo "$(date +%F\ %T) Heroku is up! http_code = $http_code" >> /home/chequim/workspace/scripts/logs/verifica_servidor.log
fi  