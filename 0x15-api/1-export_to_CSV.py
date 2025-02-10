#!/usr/bin/python3
"""Export an employee's tasks to a CSV file."""
import csv
import requests
import sys

def export_tasks_to_csv(user_id):
    base_url = "https://jsonplaceholder.typicode.com/"
    try:
        user_response = requests.get(f"{base_url}users/{user_id}")
        user = user_response.json()
        tasks = requests.get(f"{base_url}todos", params={"userId": user_id}).json()

        with open(f"{user_id}.csv", 'w', newline='') as file:
            csv_writer = csv.writer(file, quoting=csv.QUOTE_ALL)
            for task in tasks:
                csv_writer.writerow([user_id, user['username'], task['completed'], task['title']])
    except requests.RequestException:
        print("Failed to retrieve or write data.")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 script.py <user_id>")
        sys.exit(1)
    export_tasks_to_csv(sys.argv[1])
``
