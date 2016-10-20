#!/usr/bin/env bash
##################################################################################################
#                                                                                                #
#   What:     upgrade_foreman.sh                                                                 #
#                                                                                                #
#   Who:      Aaron Cupp <mrcupp@mrcupp.com>                                                     # 
#                                                                                                #
#   Purpose:  perform the steps needed to upgrade the foreman setup                              #
#             outlined here: https://theforeman.org/manuals/1.13/index.html#3.6Upgrade           #
#   When:     2016-04-22 @ 09:08                                                                 #
#   Version:  0.1                                                                                #
#                                                                                                #
##################################################################################################


# ensure the most recent repo is setup
/usr/bin/yum upgrade -y http://yum.theforeman.org/releases/1.11/el6/x86_64/foreman-release.rpm

# clean all
/usr/bin/yum clean all

# ensure that foreman-release-scl is installed;  this is new as a 1.11.x releases
/usr/bin/yum -y install foreman-release-scl

# upgrade the scl
/usr/bin/yum -y upgrade foreman-release-scl

# upgrade the foreman packages
/usr/bin/yum -y upgrade tfm\* ruby\* foreman\*

# perform the rake jobs to clean up and migrate things
/usr/sbin/foreman-rake db:migrate
/usr/sbin/foreman-rake db:seed
/usr/sbin/foreman-rake tmp:cache:clear
/usr/sbin/foreman-rake tmp:sessions:clear

# cleanly exit things
exit 0
