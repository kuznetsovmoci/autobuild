#!/bin/sh
#
# $Id$
#
cd $HOME/ACE/autobuild

svn up

$HOME/ACE/autobuild/configs/autobuild/remedynl/legolas_coiop.sh
$HOME/ACE/autobuild/configs/autobuild/remedynl/legolas_host.sh
$HOME/ACE/autobuild/configs/autobuild/remedynl/legolas_rtems.sh
