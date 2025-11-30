#################################################################################
# This script documents the workflow for connecting the Posit Cloud project to
# GitHub. It is intended as an instructional text file, not as executable R code.
# All Git commands must be executed in the *Terminal* tab, not in the Console.
#
# Assumption:
#   The project folder structure was already created using:
#     Code/creating_project_wCIDAtools.R
#################################################################################


###########################################
#### 1. Enable Git in the PositCloud Project
###########################################

# In Posit Cloud:
#   Tools > Version Control > Project Setup > Git > OK
#
# When prompted:
#   "Do you want to initialize a new Git repository for this project?"
# select "Yes".
#
# Justification:
#   Selecting “Yes” creates an empty .git directory, which activates Git’s ability 
#   to track files, create commits, and later push to GitHub. Without this step,
#   no Git operations can occur.


###########################################################
#### 2. Create an Empty GitHub Repository (External Step)
###########################################################

# 1. Sign in to GitHub at https://github.com
# 2. Create a new repository named:
#       Pla_Project_01
# 3. Do NOT add a README, .gitignore, or License (these already exist locally)
# 4. Add collaborators if needed using their GitHub usernames
#
# Justification:
#   GitHub repositories must begin empty when connecting an existing local project.
#   Adding pre-populated files can cause push conflicts during the first upload.


###############################################
#### 3. Stage Files and Make the First Commit
###############################################

### Stage all project files:
git add .

# Justification:
#   Staging selects which files should be included in the next commit. 
#   Without staging, Git does not know which files to record in the snapshot.


### Configure Git identity (required once per environment):
git config --global user.name "Lorenzo Pla"                # Name shown on commits
git config --global user.email "github-email@example.com"   # Must match GitHub email

# Justification:
#   GitHub uses the email address to associate commits with the correct account.
#   If the email does not match a verified GitHub email, commits will not appear 
#   under the user’s contribution history.


### Create the first commit:
git commit -m "Initial commit"

# Justification:
#   The first commit creates a true Git repository with a main history. 
#   Before this commit, there is no branch structure and no pushes can occur.
#   This commit is local only; nothing is uploaded yet.


##############################################################
#### 4. Connect the Local Repository to the GitHub Remote
##############################################################

### Add the GitHub repository URL as the remote origin:
git remote add origin https://github.com/username/Pla_Project_01.git
# (replace "username" with the actual GitHub username)

# Justification:
#   Adding the remote origin tells Git where the project should be pushed. 
#   This creates a permanent link between the PositCloud project and GitHub.


#####################################
#### 5. Prepare for the First Push
#####################################

### Rename the branch to match GitHub’s default:
git branch -M main

# Justification:
#   GitHub uses "main" as the default primary branch. Aligning branch names avoids 
#   confusion and ensures smooth future pulls and pushes.


### Create a GitHub Personal Access Token (PAT):
# 1. Visit: https://github.com/settings/tokens?type=beta
# 2. Generate a new token (e.g., "PositCloud Git Push")
# 3. Repository Access: Only select repositories → choose Pla_Project_01
# 4. Permissions → Repository permissions:
#        Select "Contents" → set Access to "Read and Write"
# 5. Generate the token and copy it immediately
#
# Justification:
#   GitHub no longer accepts account passwords for git push operations. 
#   A PAT serves as a secure substitute “password” for authenticated Git activity.


#########################################
#### 6. Perform the First GitHub Push
#########################################

### Push branch and contents to GitHub:
git push -u origin main

# When prompted:
#   Username: GitHub username
#   Password: Paste the PAT (will not display for security)

# Justification:
#   This command uploads the entire commit history and files to GitHub. 
#   The '-u' flag links the local "main" branch to the remote "main", enabling easier
#   future pushes using only `git push`, without specifying the remote again.


#######################################
#### 7. Expected Successful Output
#######################################

# A successful push should end with output similar to:
# Enumerating objects: 20, done.
# Counting objects: 100% (20/20), done.
# Delta compression using up to 16 threads
# Compressing objects: 100% (14/14), done.
# Writing objects: 100% (20/20), 2.68 KiB | 1.34 MiB/s, done.
# Total 20 (delta 2), reused 0 (delta 0)
# remote: Resolving deltas: 100% (2/2), done.
# remote: This repository moved. Please use the new location:
#   https://github.com/PostData-solutions/Pla_Project_01.git
# To https://github.com/postdata-solutions/Pla_Project_01.git
#  * [new branch]      main -> main
# Branch 'main' set up to track remote branch 'main' from 'origin'.


############################################
#### 8. What Comes Next
############################################

# After the initial push succeeds, the project is fully connected to GitHub.
# The following steps represent the ongoing workflow for maintaining the project:

# 1. Make changes within the PositCloud project (edit scripts, add files, run analyses).
# 2. In the Git pane (upper-right panel), review modified files and stage them.
# 3. Commit changes using clear, descriptive commit messages.
# 4. Push commits to GitHub using either:
#       - the Git pane's "Push" button, or
#       - the Terminal command: git push
# 5. For projects involving R Markdown reports:
#       - create .Rmd files in the Reports/ folder,
#       - knit to HTML/PDF/Word,
#       - commit and push both the .Rmd and the knitted output.
# 6. For dataset updates or corrections:
#       - modify the data-cleaning code,
#       - re-knit the report ensuring reproducibility,
#       - commit and push the updated files.
# 7. Before submitting projects or assignments:
#       - verify that GitHub contains all expected files,
#       - ensure the report knits cleanly from a fresh session,
#       - confirm collaborators or instructors have access to the repository.
