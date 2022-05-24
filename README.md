# build-scripts
A set of scripts used for building packages
The scripts should be used as:
```
GITHUB_DEPS += simplerobot/build-scripts
GITHUB_DEPS += simplerobot/test
GITHUB_DEPS += simplerobot/lib-jsoncpp

include ../build-scripts/build/release/include.make

default : ...

```

This example will ensure that the listed packages are included in the workspace
and built.  It will also assume the default target is "default". It will also
define the following:
```
deps : ...

PKG_BUILD_SCRIPTS_DIR = ../build-scripts/build/release
PKG_TEST_DIR = ../test/build/release
PKG_LIB_JSONCPP_DIR = ../lib-jsoncpp/build/release
```
