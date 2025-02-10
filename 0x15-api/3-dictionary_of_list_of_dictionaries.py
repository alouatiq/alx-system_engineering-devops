#!/usr/bin/python3
import requests
import json

def fetch_all_tasks():
    """ Fetches tasks for all employees and exports them to a JSON file """
    users_url = "https://jsonplaceholder.typicode.com/users"
    todos_url = "https://jsonplaceholder.typicode.com/todos"
    
    # Fetching all users and todos
    users_response = requests.get(users_url)
    todos_response = requests.get(todos_url)

    if users_response.status_code != 200 or todos_response.status_code != 200:
        print("Failed to retrieve data")
        return

    users_data = users_response.json()
    todos_data = todos_response.json()

    # Organizing tasks by user
    user_tasks = {}
    for user in users_data:
        user_id = str(user['id'])
        user_tasks[user_id] = [{
            "username": user['username'],
            "task": task['title'],
            "completed": task['completed']
        } for task in todos_data if task['userId'] == user['id']]

    # Writing to JSON file
    with open("todo_all_employees.json", 'w') as jsonfile:
        json.dump(user_tasks, jsonfile)

if __name__ == "__main__":
    fetch_all_tasks()
