#!/bin/bash

CHECKOUT_COMMIT=$(git rev-parse HEAD)
echo $CHECKOUT_COMMIT
echo TRAVIS_PULL_REQUEST $TRAVIS_PULL_REQUEST
echo TRAVIS_PULL_REQUEST_BRANCH $TRAVIS_PULL_REQUEST_BRANCH
echo TRAVIS_BRANCH $TRAVIS_BRANCH
echo TRAVIS_EVENT_TYPE $TRAVIS_EVENT_TYPE
echo TRAVIS $TRAVIS
echo CI $CI
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo $(git rev-parse --abbrev-ref HEAD)
git_command="git clone --depth=50 https://github.com/gautierbureau/test-travis.git test-travis"
git clone --depth=50 https://github.com/gautierbureau/test-travis.git test-travis
echo $git_command

if [ "$TRAVIS_OS_NAME" = "linux" ]; then
  echo Linux
  (cd /tmp;wget https://github.com/google/googletest/archive/release-1.8.1.tar.gz;tar -xzf release-1.8.1.tar.gz;cd googletest-release-1.8.1;mkdir build;cd build;cmake -G "Unix Makefiles" -DBUILD_SHARED_LIBS=ON ..;make;sudo make install)
  sudo apt-get install gcovr realpath lcov
  gem install coveralls-lcov
fi
