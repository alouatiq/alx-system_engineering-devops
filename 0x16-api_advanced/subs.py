#!/usr/bin/python3
"""
Fetches the number of subscribers for a given subreddit
using the Reddit API (no authentication required).
"""
import requests


def number_of_subscribers(subreddit):
    """Return the total number of subscribers for a given subreddit.
    If subreddit is invalid or we get a non-200 response, return 0.
    """
    # Basic validation
    if not subreddit or not isinstance(subreddit, str):
        return 0

    # Construct the URL
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    # IMPORTANT: Use a valid (non-generic) User-Agent, otherwise request may be blocked.
    headers = {
        "User-Agent": "python:holberton.project:v1.0.0 (by /u/yourusername)"
    }

    # Make the request, disallow redirects (so invalid subreddits don't redirect to search)
    response = requests.get(url, headers=headers, allow_redirects=False)

    # Check status code: must be 200 (OK). Any other -> return 0
    if response.status_code == 200:
        # Parse JSON and retrieve the 'subscribers' count
        data = response.json().get("data", {})
        return data.get("subscribers", 0)
    else:
        return 0
