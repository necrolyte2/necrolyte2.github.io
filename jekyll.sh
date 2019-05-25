#!/bin/bash

docker run --rm --volume="$PWD/vendor/bundle:/usr/local/bundle" --volume="$PWD:/srv/jekyll"   -it jekyll/jekyll:$JEKYLL_VERSION   jekyll build
