![](https://miro.medium.com/max/1400/1*c4YgRXYQayOVWxV37ourrw.png)
# Batua 
### A Personal App to track and manage your expenses!

Batua is the best money manager and daily expense tracker to automatically and securely track your monthly spends. Stay within budget, pay bills on time and SAVE more money every month. Find out how much you spend on food, shopping, groceries, etc. and how you are saving month on month.
<table>
  <th colspan = 2> UI Design </th>
<tr>
  <td><img src = "Batua2.png" width = 450 height = 500></td>
  <td><img src = "Batua1.png" width = 450 height = 500></td>
</tr>
</table>

## Project Setup Instructions 

<br>

### 1. Fork the Project 

Get your own copy of Project [Batua](https://github.com/pratyushmp/Batua) by tapping on this <kbd><b>Fork</b></kbd> button.

<br>

### 2. Clone your Forked Repo

For using your own copy of the project in your Local Machine, you need to clone your Forked Repo.

- Git Command :- 
```sh
$ git clone https://github.com/Your_Username/Batua.git
```

 > This Creates a Local Copy of this Project.

### 3. cd or move into the Project Directory

- Command :- 
  ```sh
  # This will change directory to a folder Batua
  $ cd Batua
  ```
  
  #### Make Sure you are inside this Folder before implementing following Git Commands.
  
  <br>
  
### 4. Set Remotes 
  
  > This code below tells you that *your local copy* has reference to your *forked github/remote repository*

  ```sh
  $ git remote -v
  origin https://github.com/Your_Username/Batua.git (fetch)
  originhttps://github.com/Your_Username/Batua.git (push)
  ```
  > Add a *Reference to the Original Repository* (Remote to the Original Repo) so that we can fetch or pull any recent changes in the Codebase from here
  
  ```sh
  $ git remote add upstream https://github.com/pratyushmp/Batua.git
  ```
  
  > See all the Remote Changes using the following command
  
     ```sh
     $ git remote -v
     origin    https://github.com/Your_Username/Batua.git (fetch)
     origin    https://github.com/Your_Username/Batua.git (push)
     upstream  https://github.com/pratyushmp/Batua.git (fetch)
     upstream  https://github.com/pratyushmp/Batua.git (push)
     ```
   <br>
 
 ### 5. Sync in all Changes: Keeping your Local Copy of the Repository (Forked Repo) updated with the Original Repository
 
      ```sh
      # Fetch all remote repositories and delete any deleted remote branches
      $ git fetch --all --prune

      # Switch to `master` branch
      $ git checkout master

      # Reset local `master` branch to match `upstream` repository's `master` branch
      $ git reset --hard upstream/master

      # Push changes to your forked `Batua` repo
      $ git push origin master
      ```
