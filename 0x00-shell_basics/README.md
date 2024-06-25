# 0x00. Shell, basics

## Description
This directory contains scripts written in Bash as part of the ALX School's Shell, basics project. Each script fulfills a specific task related to navigating, manipulating files, and understanding basic shell commands.

## Concepts
The project covers fundamental concepts such as:
- Understanding the shell and terminal
- Navigation commands (`cd`, `pwd`, `ls`)
- File manipulation (`cp`, `mv`, `rm`, `mkdir`)
- Working with file permissions and symbolic links
- Reading and understanding man pages
- Using shortcuts and wildcards
- Creating and managing directories
- Basics of scripting with Bash

## Resources
Read or watch:
- [What Is “The Shell”?](https://linuxcommand.org/lc3_lts0010.php)
- [Navigation](https://linuxcommand.org/lc3_lts0020.php)
- [Looking Around](https://linuxcommand.org/lc3_lts0030.php)
- [A Guided Tour](https://linuxcommand.org/lc3_lts0040.php)
- [Manipulating Files](https://linuxcommand.org/lc3_lts0050.php)
- [Working With Commands](https://linuxcommand.org/lc3_lts0060.php)
- [Reading Man pages](https://linuxcommand.org/lc3_man_pages/man1.html)
- [Keyboard shortcuts for Bash](https://linuxcommand.org/lc3_lts0100.php)
- [LTS](https://en.wikipedia.org/wiki/Long-term_support)

## Learning Objectives
At the end of this project, learners will be able to:
- Explain the purpose of RTFM and Shebang
- Differentiate between a terminal and a shell
- Utilize navigation commands effectively (`cd`, `pwd`, `ls`)
- Manage files using `cp`, `mv`, `rm`, `mkdir`
- Read and understand man pages
- Employ shortcuts and wildcards in Bash scripting

## Requirements
- Scripts are tested on Ubuntu 20.04 LTS
- Scripts are exactly two lines long (`wc -l file` should print 2)
- Scripts should end with a new line
- Scripts start with `#!/bin/bash`
- No backticks, `&&`, `||`, or `;` are allowed
- All scripts must be executable (`chmod u+x file`)

## Scripts
Here's a list of scripts included in this directory:

1. **0-current_working_directory**: Prints the absolute path of the current working directory.
2. **1-listit**: Displays the contents of the current directory.
3. **2-bring_me_home**: Changes the working directory to the user's home directory.
4. **3-listfiles**: Displays current directory contents in long format.
5. **4-listmorefiles**: Displays current directory contents, including hidden files, in long format.
6. **5-listfilesdigitonly**: Displays current directory contents in long format with numeric user and group IDs, including hidden files.
7. **6-firstdirectory**: Creates a directory named `my_first_directory` in `/tmp/`.
8. **7-movethatfile**: Moves the file `betty` from `/tmp/` to `/tmp/my_first_directory`.
9. **8-firstdelete**: Deletes the file `betty` from `/tmp/my_first_directory`.
10. **9-firstdirdeletion**: Deletes the directory `my_first_directory` from `/tmp`.
11. **10-back**: Changes the working directory to the previous one.
12. **11-lists**: Lists files in current directory, parent directory, and `/boot` in long format.
13. **12-file_type**: Prints the type of the file `iamafile` in `/tmp`.
14. **13-symbolic_link**: Creates a symbolic link `__ls__` to `/bin/ls` in the current directory.
15. **14-copy_html**: Copies HTML files from the current directory to its parent directory if they are newer.
16. **100-lets_move**: Moves files beginning with an uppercase letter to `/tmp/u`.
17. **101-clean_emacs**: Deletes files in the current directory ending with `~`.
18. **102-tree**: Creates directories `welcome/`, `welcome/to/`, and `welcome/to/school` in the current directory.
19. **103-commas**: Lists files and directories of the current directory separated by commas.
20. **school.mgc**: Magic file to detect `School` data files using `file` command.

Each script includes a detailed description and usage example in its respective file header.
