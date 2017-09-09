# foreman_updater

If you have used these scripts and tools and feel like supporting my work, please send me some funds!
```
* Bitcoin (BTC):  1NsP5TD1oRBXNC37inqFUZ9DrJN5Q1qR4y
* Monero  (XMR):  499QFXhZWBfXAuqqPJUY7ihWDWxzSDTTf7MnVQwYd6xZcSzbTFQY7B4i7zB5mTmXnQfdf6RsDmjdZJNBF6oeeW8xBz7sWa5
```

A set of simple bash shell scripts to update :link:[foreman][1] to the next major release.

* **update_foreman.sh**   :arrow_forward:  Script to call the others  :smile:
* **foreman_backup.sh**   :arrow_forward:  Script to perform the backups needed to update foreman
* **foreman_update.sh**   :arrow_forward:  Script to perform the actual update of foreman
* **foreman_install.sh**  :arrow_forward:  Script to setup / install foreman (and puppet) on a new master

This script assumes that you are using a :link:[redhat][2] derived OS and have the :link:[YUM package manager][3].
This script has been used in production on :link:[CentOS 6][4] based systems.

## Installation:
*  Checkout the repo
  * git clone
*  Allow Execution of the scripts
  * chmod +x update_foreman.sh foreman_backup.sh foreman_upgrade.sh

## Usage:
*  Run the script!
  * ./update_foreman.sh

## Want to Help?
* Fork This Repo
* Submit a PR

## To Do:
- [ ] check for OS and switch update tool used based on OS type


[1]: http://theforeman.org
[2]: https://www.redhat.com
[3]: http://yum.baseurl.org
[4]: https://www.centos.org
