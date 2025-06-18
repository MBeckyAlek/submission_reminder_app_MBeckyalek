read -p "Enter a project name: " project

maindir="submission_reminder_${project}"

mkdir -p $maindir

mkdir -p $maindir/app
mkdir -p $maindir/modules
mkdir -p $maindir/assets
mkdir -p $maindir/config


#creating the files

cat > "$maindir/app/reminder.sh" << 'EOF'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

cat > "${maindir}/modules/functions.sh" << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOF

cat > "$maindir/assets/submissions.txt" << 'EOF'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Michelle Adika, Git , not submitted 
Israel Obadiah , shell navigation , submitted 
Eri Gideon , Shell basics , not submitted
Denise , Shell basics , submitted 
Joe , git, submitted
Michael , Shell Navigation , submitted
Miraya,Shell Basics, not submitted 
Lucien , Git , not submitted 
EOF

cat > "$maindir/config/config.env" << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF


cat > "$maindir/startup.sh" << 'EOF'
#!/bin/bash
./app/reminder.sh
EOF

find "$maindir" -type f -name "*.sh" -exec chmod +x {} \;


echo "Done, Good job!"
