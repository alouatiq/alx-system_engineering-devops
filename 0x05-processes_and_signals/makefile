# Set up default SHELL
SHELL := /bin/bash

# Define the executables
SCRIPTS = 0-what-is-my-pid 1-list_your_processes 2-show_your_bash_pid 3-show_your_bash_pid_made_easy \
          4-to_infinity_and_beyond 5-dont_stop_me_now 6-stop_me_if_you_can 7-highlander \
          67-stop_me_if_you_can 8-beheaded_process 100-process_and_pid_file 101-manage_my_process \
          manage_my_process
C_PROGRAM = 102-zombie.c
C_EXEC = zombie

# Default target: make all scripts executable and build the C program
all: chmod $(C_EXEC)
	@echo "Setup complete. All scripts are executable and C program is compiled."

# Target to make all scripts executable
chmod:
	@chmod +x $(SCRIPTS)
	@echo "All scripts are now executable."

# Target to compile the C program
$(C_EXEC): $(C_PROGRAM)
	@gcc $(C_PROGRAM) -o $(C_EXEC)
	@echo "C program compiled to $(C_EXEC)."

# Run individual scripts
run-0: 0-what-is-my-pid
	@./0-what-is-my-pid

run-1: 1-list_your_processes
	@./1-list_your_processes

run-2: 2-show_your_bash_pid
	@./2-show_your_bash_pid

run-3: 3-show_your_bash_pid_made_easy
	@./3-show_your_bash_pid_made_easy

run-4: 4-to_infinity_and_beyond
	@./4-to_infinity_and_beyond

run-5: 5-dont_stop_me_now
	@./5-dont_stop_me_now

run-6: 6-stop_me_if_you_can
	@./6-stop_me_if_you_can

run-7: 7-highlander
	@./7-highlander

run-67: 67-stop_me_if_you_can
	@./67-stop_me_if_you_can

run-8: 8-beheaded_process
	@./8-beheaded_process

run-100: 100-process_and_pid_file
	@sudo ./100-process_and_pid_file

run-101: 101-manage_my_process
	@sudo ./101-manage_my_process start

run-manage: manage_my_process
	@./manage_my_process

run-zombie: $(C_EXEC)
	@./$(C_EXEC)

# Target to run all scripts (interactive scripts may require manual interruption)
run-all: $(SCRIPTS) $(C_EXEC)
	@for script in $(SCRIPTS); do \
		echo "Running $$script:"; \
		./$$script || true; \
	done
	@echo "Running zombie process demo:"
	@./$(C_EXEC)

# Clean up executables
clean:
	@rm -f $(C_EXEC)
	@echo "Cleaned up C executable $(C_EXEC)."
