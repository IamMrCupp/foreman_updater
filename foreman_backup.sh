#!/usr/bin/env bash
##################################################################################################
#                                                                                                #
#   What:     foreman_backup.sh                                                                  #
#                                                                                                #
#   Who:      Aaron Cupp  <mrcupp@mrcupp.com>                                                    #
#                                                                                                #
#   Purpose:  Perform the steps needed to backup the foreman setup before an upgrade.            #
#             - These are outlined at https://theforeman.org/manuals/1.13/index.html#5.5.1Backup #
#                                                                                                #
#   When:     2016-10-19                                                                         #
#   Version:  1.2                                                                                #
#                                                                                                #
##################################################################################################

# variables are nice
#   -   Note:  ${HOME} is an environmental variable from the user who invoked the script
#
DATESTAMP=`date +%s`  # get this in epoch time
BACKUP_DIR=${HOME}/backup-${DATESTAMP}

# make a backup location and move to it
mkdir -p ${BACKUP_DIR}
cd ${BACKUP_DIR}

# dump the foreman DB to a flatfile
foreman-rake db:dump

# move the foreman db dumpfile to the backup directory
find /usr/share/foreman/ -name "foreman.*.sql" -exec mv {} ${BACKUP_DIR} \;
find /var/lib/foreman/db/ -name "foreman.*.sql" -exec mv {} ${BACKUP_DIR} \;

# backup the various firectories that foreman uses
tar --selinux -czf etc_foreman_fire.tgz /etc/foreman
tar --selinux -czf var_lib_puppet_dir.tgz /var/lib/puppet/ssl

# cleanly exit things
exit 0
