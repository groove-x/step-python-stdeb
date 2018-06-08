#!/bin/bash

set -eu

PYTHON_INTERP=python
if [ "${WERCKER_PYTHON_STDEB_USE_PYTHON3}" == "true" ]; then
  PYTHON_INTERP+=3
fi

apt-get install -y devscripts fakeroot ${PYTHON_INTERP}-stdeb

DEBIAN_SOURCE_DIR="${WERCKER_PYTHON_STDEB_PROJECT_ROOT}/debian/source"
PYBUILD_DIR="${WERCKER_PYTHON_STDEB_PROJECT_ROOT}/.pybuild"

if [ "${WERCKER_PYTHON_STDEB_CLEAR_DEBIAN_SOURCE_DIR}" != "false" ]; then
  if [ -e ${DEBIAN_SOURCE_DIR} ]; then
    (set -x; rm -rf ${DEBIAN_SOURCE_DIR})
  fi
fi

if [ "${WERCKER_PYTHON_STDEB_CLEAR_PYBUILD_DIR}" != "false" ]; then
  if [ -e ${PYBUILD_DIR} ]; then
    (set -x; rm -rf ${PYBUILD_DIR})
  fi
fi

NOW=$(date -u +'%Y%m%dT%H%M%SZ')
cd ${WERCKER_PYTHON_STDEB_PROJECT_ROOT}

(set -x; ${PYTHON_INTERP} setup.py --command-package=stdeb.command ${WERCKER_PYTHON_STDEB_STDEB_COMMAND})

if [ "${WERCKER_PYTHON_STDEB_STDEB_COMMAND}" == "debianize" ]; then
  sed -i -e "s/-1)/-${NOW})/" debian/changelog
fi

if [ "$WERCKER_PYTHON_STDEB_CLEAN_DEBIAN_RULES" != "false" ]; then
  (set -x; fakeroot debian/rules clean)
fi

(set -x; fakeroot debian/rules binary)
