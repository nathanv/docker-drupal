#!/bin/bash
#container.ch
# example script to create a contianer

# settings
name=foo
domain=example.ch
interactive=0        # 0=daemon 1=bash
image="boran/drupal:6"  # 

#docker build -t=$image .   # only build if needed

volumes="-v /opt/sites/$name/data:/data -v /opt/sites/$name/www:/var/www -v /var  "

ports="-p 8001:80 "

envs="              \
#-e DRUPAL_GIT_REPO=boran@foo.bar.com:git/www \
-e DRUPAL_GIT_BRANCH=master "

args="$ports --restart=always $volumes $envs -e VIRTUAL_HOST=$name.$domain --hostname $name.$domain --name $name $image"
#echo $args

echo "stop, delete and run $name"
docker stop $name 2>/dev/null
docker rm $name 2>/dev/null
mkdir -p /opt/sites/$name 2>/dev/null

if [ $interactive -eq 1 ] ; then
  docker run -it $args /bin/bash
else
  docker run -dt $args
  docker logs -f $name
fi

