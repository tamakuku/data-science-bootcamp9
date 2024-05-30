
## Project File [_Click Notion Link_](https://www.notion.so/suphakit-panthu/Git-x-GitHub-dae99d069cad495787ef8df61c03a4ff?pvs=4)

# Version-Control-with-Git-GitHub-Desktop-and-VS-Code

This project come from practice made by Zinglecode.

youtube https://www.youtube.com/@Zinglecode/

Thanks for the knowledge and practice.

## Project Summary: Version Control with Git, GitHub, GitHub Desktop, and VS Code

### Objective
To provide a comprehensive guide on using Git, GitHub, GitHub Desktop, and VS Code for effective version control and project management. This guide aims to help users understand the basics of version control, setup, and manage repositories, and perform essential Git operations efficiently.

### Process
1. **Introduction to Git and GitHub**
   - Explanation of Git as a local version control system.
   - Explanation of GitHub as a remote repository hosting service.

2. **Installation and Setup**
   - Detailed steps to download and install Git.
   - Configuration of global username and email.
   - Setting up the default branch to "main".

3. **Repository Initialization**
   - Creation of a new project in VS Code.
   - Initialization of a Git repository.

4. **Staging Changes**
   - Commands to add specific files, all files, and folders.
   - Checking the status of the repository.

5. **Committing Changes**
   - Committing staged changes with messages.
   - Committing all changes with messages.

6. **Creating and Using .gitignore**
   - Creating a `.gitignore` file to exclude specific files and folders from tracking.

7. **Resetting Changes**
   - Commands to reset to previous commits and clean untracked files.

8. **Reverting Commits**
   - Reverting single and multiple commits without altering the commit history.

9. **Creating GitHub Repository**
   - Steps to create a new repository on GitHub.

10. **Pushing Changes to GitHub**
    - Adding a remote repository and pushing changes for the first time.

11. **Pulling Changes from GitHub**
    - Commands to pull updates from the remote repository.

12. **Cloning a Repository**
    - Cloning a repository using HTTPS and GitHub Desktop.

13. **Using GitHub Desktop**
    - Downloading, setting up, and using GitHub Desktop to manage repositories.

### Project Outcome
By following this guide, users will achieve:
- **Proficiency in Version Control**: Users will understand how to use Git for tracking changes and managing project versions effectively.
- **Efficient Collaboration**: With GitHub, users can collaborate with others by sharing and merging code changes seamlessly.
- **Enhanced Productivity**: Utilizing GitHub Desktop and VS Code integrations will streamline the workflow, allowing for efficient project management.
- **Strong Foundation**: Users will build a solid foundation in version control practices, enabling them to handle more advanced Git operations and workflows in the future.

### 01 What is Git, GitHub?
- **Git**: A version control system to save any changes made to project code locally on your device.
- **GitHub**: A remote hosting service to store and manage Git repositories online.

### 02 Install Git
- Download Git from [git-scm.com](https://git-scm.com/downloads).

  **Check Git Version**
  ```bash
  git --version
  ```

  **Setup Global User Information**
  ```bash
  git config --global user.name "tamakuku"
  git config --global user.email "your_email@example.com"
  ```

  **Setup Default Branch**
  ```bash
  git config --global init.defaultBranch "main"
  ```

### 03 Initialize Git Repository
- Create a new project in VS Code (e.g., `index.html`).
- Open Terminal in VS Code and initialize the repository.
  ```bash
  git init
  ```

### 04 Stage Changes (git add)
- **Add Specific File**
  ```bash
  git add index.html
  ```
- **Add All Files**
  ```bash
  git add .
  ```
- **Add Folder**
  ```bash
  git add images
  ```
- **Check Status**
  ```bash
  git status
  ```

### 05 Commit Changes (git commit)
- **Commit with Message**
  ```bash
  git commit -m "Start project"
  ```
- **Commit All Changes**
  ```bash
  git commit -am "Update HTML JS"
  ```

### 06 .gitignore
- Create a `.gitignore` file to specify untracked files.
  ```plaintext
  private-note.txt
  private-notes/
  *.md
  ```
- Add and commit `.gitignore`.
  ```bash
  git add .gitignore
  git commit -m "Add .gitignore file"
  ```

### 07 Reset Changes (git reset)
- **Reset to Previous Commit**
  ```bash
  git reset --hard HEAD
  ```
- **Clean Untracked Files**
  ```bash
  git clean -df
  ```

### 08 Revert Commits (git revert)
- **Revert Single Commit**
  ```bash
  git revert --no-edit HEAD
  ```
- **Revert Multiple Commits**
  ```bash
  git revert --no-edit --no-commit d4aa1e1..HEAD
  git commit -am "Back to 1.md"
  ```

### 09 Create GitHub Repository
- Create a new repository on [GitHub](https://github.com/).

### 10 Push to GitHub (git push)
- **Add Remote Repository**
  ```bash
  git remote add origin https://github.com/tamakuku/tama78esport.git
  git branch -M main
  ```
- **Push Changes**
  ```bash
  git push -u origin main
  ```

### 11 Pull from GitHub (git pull)
- **Pull Updates**
  ```bash
  git pull
  ```

### 12 Clone Repository (git clone)
- **Clone Using HTTPS**
  ```bash
  git clone https://github.com/tamakuku/tama78esport.git tama78esport-reborn
  ```

### 13 GitHub Desktop
- **Download GitHub Desktop**: [Download Link](https://desktop.github.com/).
- **Add Local Repository**: Go to File > Add Local repository, select the project folder.
- **Commit and Push Changes**: Track changes, commit, and push to GitHub via the desktop app.
- **Clone Repository**: Use GitHub Desktop to clone repositories to your local machine.
