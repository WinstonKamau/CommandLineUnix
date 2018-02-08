#!/usr/bin/env bash
set -x
set -o errexit
set -o pipefail
# set -u
# set -o xtrace

declare_variables() {
    NAME_TO_SEARCH=
}

create_directories() {
    cd ~
    # Make directory at the home directory.
    if [[ ! -d "directory1" ]];then
        mkdir ~/directory1
    else
        rm -rf ~/directory1
        mkdir ~/directory1
    fi
    # Make directory at the root directory
    if [[ ! -d "/example" ]];then
        sudo mkdir /example && sudo mkdir /example/directory2
    else
        sudo rm -rf /example
        sudo mkdir /example && sudo mkdir /example/directory2
    fi
}

move_to_directories_create_files() {
    # Move to a directory and create a file
    cd ~/directory1 && touch example1.txt 
    cd ~/directory1 && chmod 644 example1.txt
    cd ~/directory1 && date >> example1.txt

    cd /example/directory2 && sudo touch example2.txt
    cd /example/directory2 && sudo chmod 777 example2.txt
    cd /example/directory2 && sudo date >> example2.txt
}

copy_files() {
    # Create a directory
    cd ~
    if [[ ! -d "directory3" ]]; then
        mkdir ~/directory3
    else
        sudo rm -rf directory3
        mkdir ~/directory3
    fi
    # Copy files into directories
    if [[ ! -f "directory3/example1.txt" ]]; then
        cp ~/directory1/example1.txt ~/directory3/
    else
        sudo rm -rf ~/directory3/example1.txt
        cp ~/directory1/example1.txt ~/directory3/
    fi
    if [[ ! -f "directory3/example2.txt" ]]; then
        sudo cp /example/directory2/example2.txt ~/directory3/
    else
        sudo rm -rf ~/directory3/example2.txt
        sudo cp /example/directory2/example2.txt ~/directory3/
    fi
}

list_directory_contents() {
    # Create directory
    cd ~
    if [[ ! -d "directory4" ]]; then
        mkdir ~/directory4
    else
        sudo rm -rf directory4
        mkdir ~/directory4
    fi
    # Create file
    if [[ ! -f "directory4/directory1_dump.txt" ]]; then
        touch ~/directory4/directory1_dump.txt
    fi
    # Add write permission on file
    chmod 644 ~/directory4/directory1_dump.txt
    # List directories and save it to file
    ls -la ~/directory1 >> ~/directory4/directory1_dump.txt
    # List directories
    echo "List of directory1 contents"
    cat ~/directory4/directory1_dump.txt
}

output_redirection_of_user_input(){
    # Create directory
    cd ~
    if [[ ! -d "directory5" ]]; then
        mkdir ~/directory5
    else
        sudo rm -rf directory5
        mkdir ~/directory5
    fi
    # Create file
    if [[ ! -f "directory5/personal_info.txt" ]]; then
        touch ~/directory5/personal_info.txt
    fi
    # Add write permission to file
    chmod 644 ~/directory5/personal_info.txt
    # Add table header to file
    printf "%-15s |%-15s |%-15s\n" "First Name" "Second Name" "Phone Number" >> ~/directory5/personal_info.txt
    first_name=
    second_name=
    phone_number=

    echo -n "Insert your first name:  "

    while [[ ! "$first_name" ]]; do
        read -r answer
        if [[ "$answer" = "" ]];then
            first_name=
            echo "No input given on the first name"
            echo -n "Insert your first name:  "
        elif [[ "${#answer}" -gt 10 ]];then
            echo "You entered a name of ${#answer} characters."
            echo "Name cannot be greater than 10 characters"
            echo -n "Insert your first name:  "
        else
            first_name="${answer}"
        fi
    done

    echo -n "Insert your second name:  "

    while [[ ! $second_name ]]; do
        read -r answer
        if [[ "$answer" = "" ]];then
            second_name=
            echo "No input given on the second name"
            echo -n "Insert your second name:  "
        elif [[ "${#answer}" -gt 10 ]];then
            echo "You entered a name of ${#answer} characters."
            echo "Name cannot be greater than 10 characters"
            echo -n "Insert your second name:  "
        else
            second_name="${answer}"
        fi
    done

    echo -n "Insert your phone number:  "
    declare -r num_re='^[0-9]+$'
    while [[ ! $phone_number ]]; do
        read -r answer
        if [[ "$answer" = "" ]];then
            echo "No input given"
            echo -n "Insert your phone number:  "
        elif [[ "$answer" =~ $num_re ]];then
            phone_number="${answer}"
        else
            echo "Input has to be a number e.g. 0718217422"
            echo -n "Insert your phone number:  "
        fi
    done
    printf "%-15s |%-15s |%-15s\n" $first_name $second_name $phone_number >> ~/directory5/personal_info.txt
    echo "Personal Information File"
    cat ~/directory5/personal_info.txt
    NAME_TO_SEARCH="${first_name}"
}

redirect_input_for_search(){
    # Search for name in file
    echo "Search result for first name entered ${NAME_TO_SEARCH}"
    grep "${NAME_TO_SEARCH}" < ~/directory5/personal_info.txt >> ~/directory5/output.txt
}

pipe_commands(){
    echo "Pipe commands"
    # Create directory
    if [[ ! -d "directory1" ]];then
        mkdir ~/directory6
    else
        rm -rf ~/directory6
        mkdir ~/directory6
    fi
    # change into created directory, create file copy file, print statement and cat the file
    cd ~/directory6 | touch ~/directory6/example.txt | cp ~/directory5/output.txt ~/directory6/example.txt | echo "Print copied file" | cat ~/directory6/example.txt
}

main() {
    declare_variables
    create_directories
    move_to_directories_create_files
    copy_files
    list_directory_contents
    output_redirection_of_user_input
    redirect_input_for_search
    pipe_commands
}

main "$@"
