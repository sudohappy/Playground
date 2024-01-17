#!/bin/bash
# Script to automate Git operations
# Version 20.1

# Configuration Variables
remote_name="origin"
branch_name="main"

# Function to display changes using 'git status'
display_changes() {
    echo -e "\n\nChanges $1:"
    git status --short
    echo -e "\n\n"
}

# Function to display current configuration
display_configuration() {
    echo -e "\n\nCurrent configuration:"
    echo -e "  Remote Name: $remote_name"
    echo -e "  Branch Name: $branch_name\n"
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
    while true; do
        echo -e "\n\nSelect pull option:"
        echo -e "  1. Git Pull (Download and Merge)"
        echo -e "  2. Git Fetch (Download Only)"
        echo -e "  3. Pull specific files"
        echo -e "  4. Exit to Main Menu"
        read -p "Enter the number of your choice (1/2/3/4): " pull_option

        case $pull_option in
            1)
                git pull $remote_name $branch_name
                if (( $? != 0 )); then
                    echo -e "\n\nError: 'git pull' failed. Please check your network connection and try again.\n\n."
                    exit 1
                else
                    echo -e "\n\nGit Pull successful.\n\n."
                fi
                ;;
            2)
                git fetch $remote_name $branch_name
                if (( $? != 0 )); then
                    echo -e "\n\nError: 'git fetch' failed. Please check your network connection and try again.\n\n."
                    exit 1
                else
                    echo -e "\n\nGit Fetch successful.\n\n."
                fi
                ;;
            3)
                perform_pull_specific_files
                ;;
            4)
                echo -e "\n\nExiting pull menu.\n\n."
                return
                ;;
            *)
                echo -e "\n\nInvalid choice. Please enter a valid option.\n\n."
                ;;
        esac

        display_changes "after pulling"
    done
}

# Function to pull specific files
perform_pull_specific_files() {
    echo -e "\n\nPull specific files:"
    git status --short
    read -p "Enter the path to the file(s) you want to pull (space-separated): " files_to_pull

    git checkout -- $files_to_pull

    if (( $? != 0 )); then
        echo -e "\n\nError: 'git checkout' failed. Please check the paths and try again.\n\n."
        exit 1
    fi

    echo -e "\n\nFiles pulled successfully."
    display_changes "after pulling specific files"
}

# Function to perform Git add
perform_add() {
    while true; do
        echo -e "\n\nSelect add option:"
        echo -e "  1. Add all changes"
        echo -e "  2. Add specific files"
        echo -e "  3. Exit to Main Menu\n"
        read -p "Enter the number of your choice (1/2/3): " add_option

        case $add_option in
            1)
                git status --short
                git add .

                if (( $? != 0 )); then
                    echo -e "\n\nError: 'git add .' failed.\n\n."
                    exit 1
                else
                    echo -e "\n\nAll changes added successfully.\n\n."
                fi
                ;;
            2)
                git status --short
                read -p "Enter the path to the file(s) you want to add (space-separated): " files_to_add

                git add $files_to_add

                if (( $? != 0 )); then
                    echo -e "\n\nError: 'git add' failed.\n\n."
                    exit 1
                else
                    echo -e "\n\nSelected files added successfully.\n\n."
                fi
                ;;
            3)
                echo -e "\n\nExiting add menu.\n\n."
                return
                ;;
            *)
                echo -e "\n\nInvalid choice. Please enter a valid option.\n\n."
                ;;
        esac

        display_changes "after staging"
    done
}

# Function to push specific files
perform_push_specific_files() {
    echo -e "\n\nPush specific files:"
    git status --short
    read -p "Enter the path to the file(s) you want to push (space-separated): " files_to_push

    git add $files_to_push

    if (( $? != 0 )); then
        echo -e "\n\nError: 'git add' failed.\n\n."
        exit 1
    fi

    git commit -m "Commit specific files"

    if (( $? != 0 )); then
        echo -e "\n\nError: 'git commit' failed.\n\n."
        exit 1
    fi

    git push $remote_name $branch_name

    if (( $? != 0 )); then
        echo -e "\n\nError: 'git push' failed.\n\n."
        exit 1
    fi

    echo -e "\n\nFiles pushed successfully."
    display_changes "after pushing specific files"
}

# Function to perform Git commit
perform_commit() {
    while true; do
        display_changes "before commit"

        # Check if there are changes to commit
        if [[ -n $(git status --short) ]]; then
            echo -e "\nEnter your commit message option:"
            echo -e "  1. Upload"
            echo -e "  2. Modify"
            echo -e "  3. Update"
            echo -e "  4. Deletion"
            echo -e "  5. Exit to Main Menu"
            echo
            read -p "Enter the number of your choice (1/2/3/4/5): " commit_option

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
                5)
                    echo -e "\n\nExiting commit menu.\n\n."
                    return
                    ;;
                *)
                    echo -e "\n\nInvalid option. Please enter a valid option.\n\n."
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
                echo -e "\n\nError: 'git commit' failed.\n\n."
                exit 1
            fi

            display_changes "after commit"
        else
            echo -e "\n\nNo changes to commit.\n\n."
        fi
    done
}

# Function to push specific files
perform_push_specific_files() {
    echo -e "\n\nPush specific files:"
    git status --short
    read -p "Enter the path to the file(s) you want to push (space-separated): " files_to_push

    git add $files_to_push

    if (( $? != 0 )); then
        echo -e "\n\nError: 'git add' failed.\n\n."
        exit 1
    fi

    git commit -m "Commit specific files"

    if (( $? != 0 )); then
        echo -e "\n\nError: 'git commit' failed.\n\n."
        exit 1
    fi

    git push $remote_name $branch_name

    if (( $? != 0 )); then
        echo -e "\n\nError: 'git push' failed.\n\n."
        exit 1
    fi

    echo -e "\n\nFiles pushed successfully."
    display_changes "after pushing specific files"
}

# Function to perform Git push
perform_push() {
    while true; do
        echo -e "\n\nSelect push option:"
        echo -e "  1. Git Push (Upload)"
        echo -e "  2. Push specific files"
        echo -e "  3. Exit to Main Menu"
        read -p "Enter the number of your choice (1/2/3): " push_option

        case $push_option in
            1)
                git push $remote_name $branch_name
                if (( $? != 0 )); then
                    echo -e "\n\nError: 'git push' failed.\n\n."
                    exit 1
                else
                    echo -e "\n\nGit Push successful.\n\n."
                fi
                ;;
            2)
                perform_push_specific_files
                ;;
            3)
                echo -e "\n\nExiting push menu.\n\n."
                return
                ;;
            *)
                echo -e "\n\nInvalid choice. Please enter a valid option.\n\n."
                ;;
        esac

        display_changes "after pushing"
    done
}

# Main Loop
while true; do
    display_configuration

    echo -e "\n\nSelect Git operation:"
    echo -e "  1. Git Pull (Download)"
    echo -e "  2. Git Add"
    echo -e "  3. Git Commit"
    echo -e "  4. Git Push (Upload)"
    echo -e "  5. Configure Remote/Branch"
    echo -e "  6. Exit"
    read -p "Enter the number of your choice (1/2/3/4/5/6): " user_choice

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
            echo -e "\n\nExiting the script.\n\n."
            exit 0
            ;;
        *)
            echo -e "\n\nInvalid choice. Please enter a valid option.\n\n."
            ;;
    esac
done
