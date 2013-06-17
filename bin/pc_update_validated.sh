#!/bin/sh
#
#  $Id$
#
#  If $PC_SET_VALIDATED is set, then update validated.dat
#  Otherwise, don't do anything.
#  This script is used by auto-test and pc_auto-test.
#
if [ ${PC_SET_VALIDATED:-0} != "0" ]; then
  cd ${PENCIL_HOME}/misc/validation
  cp /tmp/pc_current_revision.dat validated.dat
  HOST=`uname -n`
  DATE=`date +"%Y-%m-%d"`
  svn copy ^/trunk ^/tags/stable_".${DATE}."
  svn ci -m "automatic validation completed: auto-test on ${HOST} by ${USER}"
fi
