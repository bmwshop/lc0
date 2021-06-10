#!/bin/sh

docker run --rm --net=host --ipc=host -v /tmp:/tmp -e DISPLAY=$DISPLAY -d lc0 
