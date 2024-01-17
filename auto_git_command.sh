#!/bin/bash
# Script to automate Git operations
# Version 16.8

# Configuration Variables
remote_name="origin"
branch_name="main"

# Function to display changes using 'git status'
display_changes() {
    echo -e "\n\n\tChanges $1:"
    git status --short
    echo -e "\n\n"
}

# Function to display current configuration
display_configuration() {
    echo -e "\n\n\tCurrent configuration:"
    echo -e "\tRemote Name: $remote_name"
    echo -e "\tBranch Name: $branch_name\n"
}

# Function to configure remote and branch
configure_remote_branch() {
    display_configuration

    read -p "Do you want to change the configuration? (y/n): " change_config

    if [[ $change_config == "y" ]]; then
        read -p "Enter new remote name (default: $remote_name): " new_remote_name
        read -p "Enter new branch name (default: $branch_name): " new_branch_name
        remote_name=${new_remote_name:-$remote_name}
        branch_name=${new_branch_name:-$branch_name}
    fi
}

# Function to perform Git pull
perform_pull() {
    git pull $remote_name $branch_name

    if (( $? != 0 )); then
        echo -e "\n\n\tError: 'git pull' failed.\n\n."
        exit 1
    fi

    display_changes "after pulling"
}

# Function to perform Git add
perform_add() {
    git add .

    if (( $? != 0 )); then
        echo -e "\n\n\tError: 'git add .' failed.\n\n."
        exit 1
    fi

    display_changes "after staging"
}

# Function to perform Git commit
perform_commit() {
    display_changes "before commit"

    # Check if there are changes to commit
    if [[ -n $(git status --short) ]]; then
        echo -e "\nEnter your commit message option:"
        echo "1. Upload"
        echo "2. Modify"
        echo "3. Deletion"
        read -p "Enter the option for your commit message: " commit_option

        case $commit_option in
            1)
                commit_type="Upload"
                ;;
            2)
                commit_type="Modify"
                ;;
            3)
                commit_type="Deletion"
                ;;
            *)
                echo -e "\n\n\tInvalid option. Exiting.\n\n."
                exit 1
                ;;
        esac

        # Prompt for additional details if needed
        if [ "$commit_type" != "Upload" ]; then
            read -p "Enter additional details: " additional_details
            commit_message="$commit_type - $additional_details"
        else
            commit_message="$commit_type"
        fi

        git commit -m "$commit_message"

        # Check if 'git commit' was successful
        if (( $? != 0 )); then
            echo -e "\n\n\tError: 'git commit' failed.\n\n."
            exit 1
        fi

        display_changes "after commit"
    else
        echo -e "\n\n\tNo changes to commit.\n\n."
    fi
}

# Function to perform Git push
perform_push() {
    echo "Executing: git push -u $remote_name $branch_name"
    git push -u $remote_name $branch_name

    if (( $? == 0 )); then
        echo -e "\n\n\tGit push successful\n\n."
    else
        echo -e "\n\n\tError: 'Git push' failed.\n\n."
        echo -e "\n\n\tDetailed information:"
        git status
        git log -n 1
        exit 1
    fi
}

# Main
while true; do
    display_configuration

    echo -e "\n\n\tSelect Git operation:"
    echo -e "\t1. Git Pull (Download)"
    echo -e "\t2. Git Add"
    echo -e "\t3. Git Commit"
    echo -e "\t4. Git Push (Upload)"
    echo -e "\t5. Configure Remote/Branch"
    echo -e "\t6. Exit"
    echo
    read -p "\tEnter your choice (1/2/3/4/5/6): " user_choice

    case $user_choice in
        1)
            perform_pull
            ;;
        2)
            perform_add
            ;;
        3)
            perform_commit
            ;;
        4)
            perform_push
            ;;
        5)
            configure_remote_branch
            ;;
        6)
            echo -e "\n\n\tExiting the script.\n\n."
            exit 0
            ;;
        *)
            echo -e "\n\n\tInvalid choice. Exiting.\n\n."
            exit 1
            ;;
    esac
done

