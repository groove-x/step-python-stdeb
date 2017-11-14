#!/bin/bash

set -e

apt-get install -y devscripts fakeroot python-stdeb

NOW=$(date -u +'%Y%m%dT%H%M%SZ')
cd ${WERCKER_PYTHON_STDEB_PROJECT_ROOT}

python setup.py --command-package=stdeb.command debianize
sed -i -e "1 s/)/-${NOW})/" debian/changelog
fakeroot debian/rules binary
