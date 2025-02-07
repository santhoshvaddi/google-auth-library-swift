#!/bin/sh
#
# Copyright 2019, Google LLC. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Install dependencies that aren't available as Ubuntu packages (or already present on macOS).
#
# Everything goes into $HOME/local.
#
# Scripts should add
# - $HOME/local/bin to PATH
# - $HOME/local/lib to LD_LIBRARY_PATH
#

cd
mkdir -p local

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  echo "Using installed Swift tools."
else
  echo "Using downloaded Swift tools."
  # Install swift
  SWIFT_URL=https://swift.org/builds/swift-5.0-release/ubuntu1404/swift-5.0-RELEASE/swift-5.0-RELEASE-ubuntu14.04.tar.gz
  echo $SWIFT_URL
  curl -fSsL $SWIFT_URL -o swift.tar.gz
  tar -xzf swift.tar.gz --strip-components=2 --directory=local
fi

# Verify installation
find local
