#!/bin/bash
read -p "Enter any assignment" New_assignment

maindir=$(find . -type d  -name "submission_reminder_*" | head -n 1 )

configfile="$maindir/config/config.env" 

sed -i "s/ASSIGNMENT=.*/ASSIGNMENT=\"${New_assignment}\"/" "$configfile"

cd $maindir
./startup.sh
