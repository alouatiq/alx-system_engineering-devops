# Set up default SHELL
SHELL := /bin/bash

# Define the executables
SCRIPTS = 0-what-is-my-pid 1-list_your_processes 2-show_your_bash_pid 3-show_your_bash_pid_made_easy \
          4-to_infinity_and_beyond 5-dont_stop_me_now 6-stop_me_if_you_can 7-highlander \
          67-stop_me_if_you_can 8-beheaded_process 100-process_and_pid_file 101-manage_my_process \
          manage_my_process
C_PROGRAM = 102-zombie.c
C_EXEC = zombie

# Set a timeout for long-running scripts (in seconds)
TIMEOUT = 5

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

# Run a script with a timeout if specified
define run_with_timeout
	@echo "Running $(1):"
	@if [[ "$(1)" == "4-to_infinity_and_beyond" || "$(1)" == "7-highlander" ]]; then \
		timeout $(TIMEOUT) ./$(1) || true; \
	else \
		./$(1) || true; \
	fi
endef

# Specific script targets
run-0: ; $(call run_with_timeout,0-what-is-my-pid)
run-1: ; $(call run_with_timeout,1-list_your_processes)
run-2: ; $(call run_with_timeout,2-show_your_bash_pid)
run-3: ; $(call run_with_timeout,3-show_your_bash_pid_made_easy)
run-4: ; $(call run_with_timeout,4-to_infinity_and_beyond)
run-5: ; $(call run_with_timeout,5-dont_stop_me_now)
run-6: ; $(call run_with_timeout,6-stop_me_if_you_can)
run-7: ; $(call run_with_timeout,7-highlander)
run-67: ; $(call run_with_timeout,67-stop_me_if_you_can)
run-8: ; $(call run_with_timeout,8-beheaded_process)
run-100: ; $(call run_with_timeout,100-process_and_pid_file)
run-101: ; $(call run_with_timeout,101-manage_my_process)
run-manage: ; $(call run_with_timeout,manage_my_process)
run-zombie: ; $(call run_with_timeout,$(C_EXEC))

# Run all scripts sequentially, handling long-running ones with timeout
run-all: $(SCRIPTS) $(C_EXEC)
	@for script in $(SCRIPTS); do \
		$(call run_with_timeout,$$script); \
	done
	@echo "Running zombie process demo:"
	@./$(C_EXEC)

# Clean up executables
clean:
	@rm -f $(C_EXEC)
	@echo "Cleaned up C executable $(C_EXEC)."
