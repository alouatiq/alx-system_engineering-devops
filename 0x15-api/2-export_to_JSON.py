#!/usr/bin/python3
import requests
import sys
import json

def export_tasks_to_json(employee_id):
    """ Fetches tasks and exports them to a JSON file """
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

    # JSON file creation
    with open(f"{employee_id}.json", 'w') as jsonfile:
        tasks_list = [{
            "username": user_data['username'],
            "task": task['title'],
            "completed": task['completed']
        } for task in todos_data]

        json.dump({str(employee_id): tasks_list}, jsonfile)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: ./2-export_to_JSON.py <employee_id>")
    else:
        export_tasks_to_json(int(sys.argv[1]))
