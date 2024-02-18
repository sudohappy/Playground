<a name='top'></a>

<h2 align='center'>Playground Collaboration Guidelines</h2>

<p align='center'>Welcome to the collab! To ensure a smooth and organized collaboration, follow these guidelines</p>


<br>

<!-- The Almight Dancing GIF -->

<div align='center'>
	<a href='https://github.com/sudohappy/Playground'>
		<img src='CL/img/dance.gif' alt='Anime Girl dance' height='179' width='160'>
	</a>
</div>

<br>
<!-- Out with the Old and IN WITH THE NEW
## Table of CONTENTS :sunglasses:
- [Folder Structure](#Folder-Structure)
- [Usage Guidelines](#Usage-Guidelines)
- [Resources](#Resources)
- [Reminder](#Reminder)
-->
<!-- The New New Table of content -->
<div align='center'>
	<details>
		<summary>Table of Contents</summary>
		<ul>
			<a href='#Quick-Rundown'>Quick Rundown</a><br>
			<a href='#Usage-Guidelines'>Usage Guidelines</a><br>
			<a href='#Resources'>Resources</a><br>
			<a href='#Reminder'>Reminder</a><br>
		</ul>
	</details>
</div><br>

## **Quick Rundown**

**Root Directory**:

- The root directory is open for collaborative work. Feel free to contribute, modify, or add files outside individual folders.

**Personal Folders**:	

- After joining the collaboration, create a personal folder with your initials. This is your designated space to upload and manage your files.
Please maintain your personal folder and refrain from mkaing changes to others' personal spaces without permission.

**Branch**:

- After creating and uploading the branch to the remote repo, ensure that you switch to that branch when working on any task by using the command 'git checkout branchName' before starting

**Pull Request**:

- When you're ready to merge your branch into the main branch, ensure your branch is prepared for merging, then initiate a pull request on github

**Questions/Concerns**:

- Don't hesitate to ask anyone in the collaboration for assistance; I'm sure everyone is eager to help out when needed

**Setup**:

1. Create a empty folder. (EX: Playground)
   - Command git init

   - Command git remote add origin https://github.com/sudohappy/Playground.git

   - Command git fetch origin main --> You should see the files on GitHub on your device

2. Make Personal Folders --> mkdir "your folder name using your first 2 initials"
   - **Example:** Name John Doe therefore creating a folder JD

   - Command git add "your folder name"

   - **Example:** git add "JD"
      - Add preps the files for commiting
      - using . add all changes you've done in the local machine (EX: git add .)

   - Command git commit -m 'Adding new directory to repo'
      - The option -m specify a commit message

3. Create a README.md in your personal folder --> git add "your folder name"/README.md and uploading it to the remote repo
   - **Example:** git add "JD/READ.md" <br>

   - Command git commit -m 'Adding new file to repo'
      - The option -m specify a commit message<br>

   - Command git push origin main
      - Push means upload
      - Origin means default name for the repo or something along those lines
      - Main is the name of the branch<br>

4. Creating a Branch for you to work in and uploading it to the remote repo
   - Command git checkout -b branchName<br>

   - **Example:** git checkout -b Canada
      - The option '-b' in this command enables you to name the branch with a specified name
      - Now you created a branch named Canada on your local machine
      - To verify, use the command git branch to see all the branches on your local machine<br>

   - Command git push origin branchName<br>

   - **Example:** git push origin Canada
      - This commands uploads the branch to the remote repo<br>

<div align='right'>
	<a href='#top'>Back to Top</a></h5>
</div>

## **Usage Guidelines**

**README File**:

- The README file serves as an introduction and guideline. Please review it to understand the collaborative process.

**Version Control**:

- Use version control best practices, such as branching and pull requests, to manage collaborative changes effectively.

**Feedback and Discussion**:

- Engage in discussions through issues or other communication channels. Provide constructive feedback and seek clarification when needed.

<div align='right'>
	<a href='#top'>Back to Top</a></h5>
</div>


## **Resources**

<a href='https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#images'>Basic writing and formatting syntax</a>

<a href='https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md'>Adding Emoji's to README file</a>

<div align='right'>
	<a href='#top'>Back to Top</a></h5>
</div>


## **Reminder**

When you see this v

<div align='center'>
   <a href='https://github.com/sudohappy/Playground'>
      <img src='CL/img/exmaple/commit.jpg' alt='1 commit ahead/behind'>
   </a>
</div>

**1 commit ahead**: Your branch is ahead of the main branch. This indicates that you've made changes in your branch that are not yet reflected in the main branch. To incorporate these changes into the main branch, you'll need to create a pull request.

**1 commit behind**: Your branch is behind the main branch. This means that there have been updates made to the main branch that are not present in your branch. To bring your branch up to date with the latest changes from the main branch, you can use the following commands:
- Terminal
   - git fetch
   - git pull origin main
      - :q!
   - git push origin branchName

> [!IMPORTANT]
> When using the terminal and executing 'git pull origin main', Git merges the changes from the main branch into your current branch. This operation may open the Vim text editor to prompt you to enter a commit message. Typically, Git provides a default commit message summarizing the merge operation. To proceed with the merge without making any changes to the commit message, you can press the ESC key followed by typing ':q!' to exit Vim and finalize the merge.

This is just an area to get a better understanding on how to use github and collab with others. Feel free to upload useless files. Don't forget to have fun.


<div align='right'>
	<a href='#top'>Back to Top</a></h5>
</div>


<h4 align='center'>STILL UNDER CONSTRUCTION</h4><br>

<div align='center'>
	<a href='https://github.com/sudohappy/Playground'>
		<img src='CL/img/rage.gif' alt='Angry Face' heigh='100' width='100'>
	</a>
</div>

