#!/bin/sh
#
# $Id$
#

cd /builds/autobuild

git pull

exec /usr/bin/perl /builds/autobuild/autobuild.pl \
                             /builds/autobuild/configs/autobuild/abdul/lion_full_static_llvm.xml
