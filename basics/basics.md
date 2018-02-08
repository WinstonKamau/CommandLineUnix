**Note** : Before running this script ensure you do not have the following:
* Directories at your home `~` path with the names : directory1, directory2, directory3, directory4, directory5, directory6
* A directory with the name **example** at you root `/`folder

## How to run the script

Currently the script has been tested for running on Mac Os.

1. Clone the repository by running the command

`git clone https://github.com/WinstonKamau/CommandLineUnix.git`

2. Change directory to the basics folder e.g. if repo was clone on the `~` path then:


`cd ~/CommandLineUnix/basics`

3. If you have bash in your terminal, run the command `bash shell_script.sh`. If you do not have bash then run the commands below:
- `chmod 744 shell_script.sh` 
- `./shell_script.sh`

4. While executing the file, a password may be asked to run any sudo commands. Give your system's password.

## What does this Script do?
1. The following script creates **directory1** at the `~` path, and **directory2** at the `/example/` path.

2. It moves to each of the directories created in step 1 and creates the file **example1.txt** at the path `~/directory1/example1.txt` and **example2.txt** at the path `/example/directory2/example2.txt`. Each of the files contains the date at which the command was run.

3. It creates a directory **directory3** and copies the files created in step 2 into the path `~/directory3/example1.txt` and `~/directory3/example2.txt`

4. It creates a directory **directory4** and a dump file on the path `~/directory4/directory1_dump.txt`. It then lists files in **directory1** that was added by step 2 and appends it on the file. The list is then printed.

5. It creates a directory **directory5** and then asks the user for his:
- First name (Less than 10 characters)
- Last Name (Less than 10 characters)
- Phone Number (Should be numbers)


and redirects the input into a file on the path `~/directory5/personal_info.txt`

6. It gives input from the file created in step 5 into a grep command that searches for the first name on the personal info file. The results of the search are piped into the file `~/directory5/output.txt`.

7. It creates a directory **directory6** and then runs a pipe of commands that:
- moves to a directory and creates a file
- copies the file on the path `~/directory5/output.txt` into directory6 with the name example.txt
- Prints out contents of the file '~/directory6/example.txt`
