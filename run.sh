#!/bin/bash

set -eu

apt-get install -y devscripts fakeroot python-stdeb

DEBIAN_SOURCE_DIR="${WERCKER_PYTHON_STDEB_PROJECT_ROOT}/debian/source"
PYBUILD_DIR="${WERCKER_PYTHON_STDEB_PROJECT_ROOT}/.pybuild"

if [ "${WERCKER_PYTHON_STDEB_CLEAR_DEBIAN_SOURCE_DIR}" != "false" ]; then
  if [ -e ${DEBIAN_SOURCE_DIR} ]; then
    echo "rm -rf ${DEBIAN_SOURCE_DIR}"
    rm -rf ${DEBIAN_SOURCE_DIR}
  fi
fi

if [ "${WERCKER_PYTHON_STDEB_CLEAR_PYBUILD_DIR}" != "false" ]; then
  if [ -e ${PYBUILD_DIR} ]; then
    echo "rm -rf ${PYBUILD_DIR}"
    rm -rf ${PYBUILD_DIR}
  fi
fi

NOW=$(date -u +'%Y%m%dT%H%M%SZ')
cd ${WERCKER_PYTHON_STDEB_PROJECT_ROOT}

echo "python setup.py --command-package=stdeb.command ${WERCKER_PYTHON_STDEB_STDEB_COMMAND}"
python setup.py --command-package=stdeb.command ${WERCKER_PYTHON_STDEB_STDEB_COMMAND}

if [ "${WERCKER_PYTHON_STDEB_STDEB_COMMAND}" == "debianize" ]; then
  sed -i -e "s/-1)/-${NOW})/" debian/changelog
fi

if [ "$WERCKER_PYTHON_STDEB_CLEAN_DEBIAN_RULES" != "false" ]; then
  echo "fakeroot debian/rules clean"
  fakeroot debian/rules clean
fi

echo "fakeroot debian/rules binary"
fakeroot debian/rules binary
