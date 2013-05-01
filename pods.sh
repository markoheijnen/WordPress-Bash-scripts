#!/bin/bash

#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(dirname $0)

cd $DIR

if [ ! -d "$DIR/pods" ]; then
	git clone git://github.com/pods-framework/pods.git
	#git branch 2.x
fi

cd $DIR/pods
git pull 1>&1 | grep "Already up-to-date."


mkdir -p $DIR/tmp/
bash $DIR/i18n.sh wp-plugin $DIR/pods $DIR/tmp/pods.pot init

# GlotPress
# "-p <project-path> -f <file> [-o <format>]"
if [ ! -d "$DIR/../glotpress/scripts/import-originals.php" ]; then
	php $DIR/../glotpress/scripts/import-originals.php -p pods-framework/dev -f $DIR/tmp/pods.pot
fi
