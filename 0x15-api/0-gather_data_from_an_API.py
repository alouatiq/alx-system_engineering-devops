#!/usr/bin/python3
"""Returns to-do list information for a given employee ID."""
import requests
import sys

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: {} <user_id>".format(sys.argv[0]))
        sys.exit(1)

    url = "https://jsonplaceholder.typicode.com/"
    try:
        user_response = requests.get(url + "users/{}".format(sys.argv[1]))
        user_response.raise_for_status()  # Raises an HTTPError for bad responses
        todos_response = requests.get(url + "todos", params={"userId": sys.argv[1]})
        todos_response.raise_for_status()

        user = user_response.json()
        todos = todos_response.json()
        completed = [t.get("title") for t in todos if t.get("completed") is True]

        print("Employee {} is done with tasks({}/{}):".format(
            user.get("name"), len(completed), len(todos)))
        [print("\t {}".format(c)) for c in completed]

    except requests.RequestException as e:
        print("HTTP Request failed: {}".format(e))

