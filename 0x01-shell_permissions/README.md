# 0x01. Shell, permissions

## Description
This project is focusing on shell scripts and permissions in Bash. It consists of several scripts designed to automate various tasks related to file permissions and ownership in Linux.

## Concepts
The project covers the following key concepts:
- Linux file permissions (`chmod`)
- Ownership and group management (`chown`, `chgrp`)
- Users and groups (`adduser`, `useradd`, `addgroup`)
- Sudo and su commands for privilege escalation
- Understanding of file permissions representation (numeric and symbolic)

## Files
Each script performs a specific task:
- `0-iam_betty`: Switches the current user to `betty`.
- `1-who_am_i`: Prints the effective username of the current user.
- `2-groups`: Prints all groups the current user is part of.
- `3-new_owner`: Changes the owner of the file `hello` to `betty`.
- `4-empty`: Creates an empty file called `hello`.
- `5-execute`: Adds execute permission to the owner of the file `hello`.
- `6-multiple_permissions`: Adds execute permission to owner and group, and read permission to others for `hello`.
- `7-everybody`: Adds execute permission to owner, group, and others for `hello`.
- `8-James_Bond`: Sets permissions for `hello` to owner: no permissions, group: no permissions, others: all permissions.
- `9-John_Doe`: Sets permissions for `hello` to `-rwxr-x-wx`.
- `10-mirror_permissions`: Sets permissions for `hello` to match those of `olleh`.
- `11-directories_permissions`: Adds execute permission to all subdirectories in the current directory.
- `12-directory_permissions`: Creates a directory `my_dir` with permissions `751`.
- `13-change_group`: Changes group owner of `hello` to `school`.
- `100-change_owner_and_group`: Changes owner to `vincent` and group owner to `staff` for all files and directories in the working directory.
- `101-symbolic_link_permissions`: Changes owner to `vincent` and group owner to `staff` for the symbolic link `_hello`.
- `102-if_only`: Changes owner of `hello` to `betty` only if it is currently owned by `guillaume`.
- `103-Star_Wars`: Script to play Star Wars Episode IV in the terminal.

## Usage
To run any script, clone the repository and execute it in your terminal:
```bash
./<script_name>
