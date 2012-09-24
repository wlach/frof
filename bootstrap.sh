#!/bin/sh

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.

which virtualenv > /dev/null
if [ $? != 0 ]; then
    echo "Please install virtualenv ('sudo apt-get install -y python-virtualenv' on Ubuntu)"
    exit 1
fi

which arm-eabi-addr2line > /dev/null
if [ $? != 0 ]; then
    echo "Please make sure arm-eabi-addr2line is in your PATH (see README.md)"
    exit 1
fi

# Check out git submodules
git submodule init
git submodule update

# Create virtualenv
virtualenv .

./bin/pip install mozdevice
