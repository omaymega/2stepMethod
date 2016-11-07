#!/bin/bash

sudo apt-get install git

CONTR=(ODL ONS RYU)

echo "Install controllers..."
for CONTR_DIR in $CONTR ; do
	./$1/$CONTR_DIR/install.sh
done
