#!/bin/bash

DIR=$(dirname $0)
cd $DIR

if [ ! -d "$DIR/i18n" ]; then
	git clone git://github.com/markoheijnen/wp-i18n-tools.git i18n
fi

cd $DIR/i18n
git pull 1>&1 | grep "Already up-to-date."

if [ "$#" -ge 3 ]; then
	php makepot.php "$@"
fi