## Operating System

Currently the two script files above have been tested on Darwin 16.7.0 and Ubuntu 16.04.

## How to execute

**Note:** While executing the command on MacOs (Darwin platform), bear in mind that if the operating system is secured, password will be asked while executing the file cron_time_entry_sudo.sh.

### Step 1. Clone the repository.
`git clone https://github.com/WinstonKamau/CommandLineUnix.git`
### Step 2. Change directory.
cd into the folder cronjobs using the command **if repo is cloned on the `~` path**


`cd ~/CommandLineUnix/cronjobs`
### Step 3. Execute the files.
Choose one of the files to add the cron job. Pick the commands that run that particular file.
#### - Using bash
You can either use bash if installed in you command line terminal and run the command 
* `bash cron_time_entry.sh` **or**
* `bash cron_time_entry_sudo.sh`
#### - Without bash
If you do not have bash installed then run the commands below to give execution rights to run the files.
* `chmod 744 cron_time_entry.sh` **or** 
* `chmod 744  cron_time_entry_sudo.sh`


Execute the scripts using the commands below:


* `./cron_time_entry.sh` **or**
* `./cron_time_entry_sudo.sh`

## What the files do

### cron_time_entry.sh

The script creates a file and changes its permissions attribute to enable write capabilities on the created file.
It then adds a cron job to the crontab that is meant to add date information into the file every two hours.

Output after every two hours can be viewed on the file by running the command `cat ~/file_dump.txt`

To check if the cronjob was added to the crontab simply run the command `crontab -l`

### cron_time_entry_sudo.sh

The script simply adds a cron job to the sudo crontab, that runs every two hours, adding date information into a file.

Output added after every two hours can be viewed on the file by running the following steps.

#### On a MacBook ( Darwin Platform )

1. `sudo su`
2. `cd /var/root`
3. `cat file_dump2.txt`

#### On Ubuntu

1. `sudo su`
2. `cd /root`
3. `cat file_dump2.txt`

To check if the cronjob was added to the crontab simply run the command `sudo crontab -l`. If operating system has password, then password may be queried for input.


