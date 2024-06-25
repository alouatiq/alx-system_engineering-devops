# Shell, init files, variables and expansions

## Project Description
This project is focused on exploring shell scripting, including the use of init files, variables, and expansions. The tasks cover a wide range of topics, such as creating aliases, manipulating environment variables, performing arithmetic operations, and more.

### General
- What happens when you type `$ ls -l *.txt`

### Shell Initialization Files
- What are the `/etc/profile` file and the `/etc/profile.d` directory
- What is the `~/.bashrc` file

### Variables
- What is the difference between a local and a global variable
- What is a reserved variable
- How to create, update and delete shell variables
- What are the roles of the following reserved variables: `HOME`, `PATH`, `PS1`
- What are special parameters

### Expansions
- What is expansion and how to use them
- What is the difference between single and double quotes and how to use them properly
- How to do command substitution with `$()` and backticks

### Shell Arithmetic
- How to perform arithmetic operations with the shell

### The `alias` Command
- How to create an alias
- How to list aliases
- How to temporarily disable an alias

### Other `Help` Pages
- How to execute commands from a file in the current shell

## Usage
To use the scripts in this project, follow these steps:

1. Clone the repository:
```
git clone https://github.com/your-username/alx-system_engineering-devops.git
```

2. Navigate to the `0x03-shell_variables_expansions` directory:
```
cd alx-system_engineering-devops/0x03-shell_variables_expansions
```

3. Run the desired script:
```
./script_name.sh
```

Replace `script_name.sh` with the name of the script you want to run.

## Additional Resources
- Read your `/etc/profile`, `/etc/inputrc` and `~/.bashrc` files.
- Look at some files in the `/etc/profile.d` directory.

  ## Tasks/files

1. **0-alias**
   - Creates an alias named `ls` that executes `rm *`.

2. **1-hello_you**
   - Prints "hello \<user\>", where \<user\> is the current Linux user.

3. **2-path**
   - Adds `/action` to the `PATH` environment variable.

4. **3-paths**
   - Counts the number of directories in the `PATH`.

5. **4-global_variables**
   - Lists all environment variables.

6. **5-local_variables**
   - Lists all local variables, environment variables, and functions.

7. **6-create_local_variable**
   - Creates a new local variable named `BEST` with the value `School`.

8. **7-create_global_variable**
   - Creates a new global variable named `BEST` with the value `School`.

9. **8-true_knowledge**
   - Prints the result of adding 128 with the value stored in the environment variable `TRUEKNOWLEDGE`.

10. **9-divide_and_rule**
    - Prints the result of dividing the value stored in `POWER` by `DIVIDE`.

11. **10-love_exponent_breath**
    - Displays the result of raising `BREATH` to the power of `LOVE`.

12. **11-binary_to_decimal**
    - Converts a binary number stored in `BINARY` to decimal.

13. **12-combinations**
    - Prints all possible combinations of two letters from a to z, excluding "oo".

14. **13-print_float**
    - Prints the value stored in `NUM` with two decimal places.

15. **100-decimal_to_hexadecimal**
    - Converts a decimal number stored in `DECIMAL` to hexadecimal.

16. **101-rot13**
    - Encrypts and decrypts text using the rot13 encryption.

17. **102-odd**
    - Prints every other line from the input.

18. **103-water_and_stir**
    - Adds numbers stored in `WATER` and `STIR`, with results in `bestchol`.
