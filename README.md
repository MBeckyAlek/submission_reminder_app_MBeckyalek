# submission_reminder_app_Mbeckyalek

# Submission Reminder System

A simple Bash tool to track which students haven't submitted their assignments.

## What it does

- Reads a list of students and their submission status from a CSV file
- Shows which students haven't submitted a specific assignment
- Displays days remaining until deadline

## Quick Start

1. **Setup**: Run the first script and enter a project name
   ```bash
   bash create_environment.sh
   ```

2. **Check submissions**: Use the second script to check any assignment
   ```bash
   bash copilot.sh
   ```

## Files Created

- `submissions.txt` - Student data (you can edit this)
- `config.env` - Assignment name and days remaining
- `reminder.sh` - Main program that shows missing submissions

## Example Output

```
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
```

## How to Use

1. Edit `submissions.txt` to add your students
2. Run the update script and enter the assignment name
3. The system shows who hasn't submitted yet

That's it! Simple assignment tracking in just a few commands.
