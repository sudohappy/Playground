#!/bin/bash
# Script to automate Git operations
# Version 19.3

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

# Function to perform Git pull or fetch
perform_pull() {
    echo -e "\n\n\tSelect pull option:"
    echo -e "\t1. Git Pull (Download and Merge)"
    echo -e "\t2. Git Fetch (Download Only)"
    echo -e "\t3. Pull specific files"
    read -p "\tEnter your choice (1/2/3): " pull_option

    case $pull_option in
        1)
            git pull $remote_name $branch_name
            if (( $? != 0 )); then
                echo -e "\n\n\tError: 'git pull' failed.\n\n."
                exit 1
            fi
            ;;
        2)
            git fetch $remote_name $branch_name
            if (( $? != 0 )); then
                echo -e "\n\n\tError: 'git fetch' failed.\n\n."
                exit 1
            fi
            ;;
        3)
            perform_pull_specific_files
            ;;
        *)
            echo -e "\n\n\tInvalid choice. Exiting.\n\n."
            exit 1
            ;;
    esac

    display_changes "after pulling"
}

# Function to pull specific files
perform_pull_specific_files() {
    echo -e "\n\n\tPull specific files:"
    read -p "Enter the path to the file(s) you want to pull (space-separated): " files_to_pull

    git checkout -- $files_to_pull

    if (( $? != 0 )); then
        echo -e "\n\n\tError: 'git checkout' failed.\n\n."
        exit 1
    fi

    echo -e "\n\n\tFiles pulled successfully."
    display_changes "after pulling specific files"
}

# Function to perform Git add
perform_add() {
    echo -e "\n\n\tSelect add option:"
    echo -e "\t1. Add all changes"
    echo -e "\t2. Add specific files"
    read -p "\tEnter your choice (1/2): " add_option

    case $add_option in
        1)
            git add .

            if (( $? != 0 )); then
                echo -e "\n\n\tError: 'git add .' failed.\n\n."
                exit 1
            fi
            ;;
        2)
            read -p "Enter the path to the file(s) you want to add (space-separated): " files_to_add

            git add $files_to_add

            if (( $? != 0 )); then
                echo -e "\n\n\tError: 'git add' failed.\n\n."
                exit 1
            fi
            ;;
        *)
            echo -e "\n\n\tInvalid choice. Exiting.\n\n."
            exit 1
            ;;
    esac

    display_changes "after staging"
}

# Function to push specific files
perform_push_specific_files() {
    echo -e "\n\n\tPush specific files:"
    read -p "Enter the path to the file(s) you want to push (space-separated): " files_to_push

    git add $files_to_push

    if (( $? != 0 )); then
        echo -e "\n\n\tError: 'git add' failed.\n\n."
        exit 1
    fi

    git commit -m "Commit specific files"

    if (( $? != 0 )); then
        echo -e "\n\n\tError: 'git commit' failed.\n\n."
        exit 1
    fi

    git push $remote_name $branch_name

    if (( $? != 0 )); then
        echo -e "\n\n\tError: 'git push' failed.\n\n."
        exit 1
    fi

    display_changes "after pushing specific files"
}

# Function to perform Git commit
perform_commit() {
    display_changes "before commit"

    # Check if there are changes to commit
    if [[ -n $(git status --short) ]]; then
        echo -e "\nEnter your commit message option:"
        echo "1. Upload"
        echo "2. Modify"
        echo "3. Update"
        echo "4. Deletion"
        read -p "Enter the option for your commit message: " commit_option

        case $commit_option in
            1)
                commit_type="Upload"
                ;;
            2)
                commit_type="Modify"
                ;;
            3)
                commit_type="Update"
                ;;
            4)
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
    echo -e "\n\n\tSelect push option:"
    echo -e "\t1. Git Push (Upload)"
    echo -e "\t2. Push specific files"
    read -p "\tEnter your choice (1/2): " push_option

    case $push_option in
        1)
            git push $remote_name $branch_name
            if (( $? != 0 )); then
                echo -e "\n\n\tError: 'git push' failed.\n\n."
                exit 1
            fi
            ;;
        2)
            perform_push_specific_files
            ;;
        *)
            echo -e "\n\n\tInvalid choice. Exiting.\n\n."
            exit 1
            ;;
    esac

    display_changes "after pushing"
}

# Main Loop
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
