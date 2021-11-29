#!/bin/sh

docker run --detach \
    -p 21000:21000 \
    --name atlas \
    sburn/apache-atlas \
    /opt/apache-atlas-2.1.0/bin/atlas_start.py


until [ "`docker inspect -f {{.State.Running}} $(docker ps -a | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} atlas | awk '{print $1}')`"=="true" ]; do
  echo "waiting....."
  sleep 1
done;

echo "container runnin....."
docker exec -ti atlas /opt/apache-atlas-2.1.0/bin/quick_start.py



# docker exec -ti atlas /opt/apache-atlas-2.1.0/bin/quick_start.py &&
# echo "admin / admin" &&
# open http://localhost:21000/login.jsp