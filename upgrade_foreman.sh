#!/usr/bin/env bash
##################################################################################################
#                                                                                                #
#   What:     upgrade_foreman.sh                                                                 #
#                                                                                                #
#   Who:      Aaron Cupp <mrcupp@mrcupp.com>                                                     #
#                                                                                                #
#   Purpose:  run the two scripts and update foreman to the newest version                       #
#                                                                                                #
#   When:     2016-10-20                                                                         #
#   Version:  1.2                                                                                #
#                                                                                                #
##################################################################################################



# prompt for the version when running;
# abort and scream at the user if they don't do it right

echo "Foreman Upgrader Starting!"

# run the backup
./foreman_backup.sh

# run the upgrade
./foreman_upgrade.sh

echo "Foreman Upgrader Finished!"

# quit cleanly
exit 0
