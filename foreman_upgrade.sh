#!/usr/bin/env bash
##################################################################################################
#                                                                                                #
#   What:     foreman_upgrade.sh                                                                 #
#                                                                                                #
#   Who:      Aaron Cupp <mrcupp@mrcupp.com>                                                     # 
#                                                                                                #
#   Purpose:  perform the steps needed to upgrade the foreman setup                              #
#             - outlined here: https://theforeman.org/manuals/1.13/index.html#3.6Upgrade         #
#                                                                                                #
#   When:     2016-10-20                                                                         #
#   Version:  1.2                                                                                #
#                                                                                                #
##################################################################################################

PMAPP='/usr/bin/yum'
FORCE='-y'
VERSION='1.13'
OSTYPE='el7'
ARCH='x86_64'

# ensure the most recent repo is setup
${PMAPP} ${FORCE} upgrade http://yum.theforeman.org/releases/${VERSION}/${OSTYPE}/${ARCH}/foreman-release.rpm

# clean all
${PMAPP} clean all

# ensure that foreman-release-scl is installed;  this is new as a 1.11.x releases
${PMAPP} ${FORCE} install foreman-release-scl

# upgrade the scl
${PMAPP} ${FORCE} upgrade foreman-release-scl

# upgrade the foreman packages
${PMAPP} ${FORCE} upgrade tfm\* ruby\* foreman\*

# perform the rake jobs to clean up and migrate things
/usr/sbin/foreman-rake db:migrate
/usr/sbin/foreman-rake db:seed
/usr/sbin/foreman-rake tmp:cache:clear
/usr/sbin/foreman-rake tmp:sessions:clear

# cleanly exit things
exit 0
