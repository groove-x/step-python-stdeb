#!/bin/bash

set -eu

apt-get install -y devscripts fakeroot python-stdeb

DEBIAN_SOURCE_DIR="${WERCKER_PYTHON_STDEB_PROJECT_ROOT}/debian/source"

if [ "$WERCKER_PYTHON_STDEB_CLEAR_DEBIAN_SOURCE_DIR" != "false" ]; then
  if [ -e ${DEBIAN_SOURCE_DIR} ]; then
    rm -rf ${DEBIAN_SOURCE_DIR}
  fi
fi

NOW=$(date -u +'%Y%m%dT%H%M%SZ')
cd ${WERCKER_PYTHON_STDEB_PROJECT_ROOT}

python setup.py --command-package=stdeb.command ${WERCKER_PYTHON_STDEB_STDEB_COMMAND}
sed -i -e "s/-1)/-${NOW})/" debian/changelog
fakeroot debian/rules binary
