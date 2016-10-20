#!/usr/bin/env bash
##################################################################################################
#                                                                                                #
#   What:     foreman_install.sh                                                                 #
#                                                                                                #
#   Who:      Aaron Cupp  <mrcupp@mrcupp.com>                                                    #
#                                                                                                #
#   Purpose:  Perform the steps needed to install foreman on a new server.                       #
#             - Outlined at https://theforeman.org/manuals/1.11/index.html#2.1Installation       #
#             - Outlined at: https://theforeman.org/manuals/1.11/index.html#3.InstallingForeman  #
#   When:     2016-10-20                                                                         #
#   Version:  1.2                                                                                #
#                                                                                                #
##################################################################################################

# setup the puppetlabs repo for puppet
/bin/rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

# setup the EPEL and foreman repo
/bin/yum -y install epel-release 
/bin/yum -y install https://yum.theforeman.org/releases/1.11/el7/x86_64/foreman-release.rpm

# install the foreman-installer
/bin/yum -y install foreman-installer

# run the installer
/usr/local/sbin/foreman-installer

# exit the app cleanly
exit 0

# todo:	  make better
#	  make debian/apt installers an option
