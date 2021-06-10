#!/bin/sh

docker run --rm --net=host --ipc=host -v /tmp:/tmp -e DISPLAY=$DISPLAY -ti lc0 bash
