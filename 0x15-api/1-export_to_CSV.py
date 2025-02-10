#!/usr/bin/python3
import requests
import sys
import csv

def export_tasks_to_csv(employee_id):
    """ Fetches tasks and exports them to a CSV file """
    # API endpoints
    user_url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"
    todos_url = f"https://jsonplaceholder.typicode.com/todos?userId={employee_id}"

    # Fetching data
    user_response = requests.get(user_url)
    todos_response = requests.get(todos_url)

    if user_response.status_code != 200 or todos_response.status_code != 200:
        print("Failed to retrieve data")
        return

    user_data = user_response.json()
    todos_data = todos_response.json()

    # CSV file creation
    with open(f"{employee_id}.csv", 'w', newline='') as csvfile:
        taskwriter = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        for task in todos_data:
            taskwriter.writerow([employee_id, user_data['username'], task['completed'], task['title']])

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: ./1-export_to_CSV.py <employee_id>")
    else:
        export_tasks_to_csv(int(sys.argv[1]))
