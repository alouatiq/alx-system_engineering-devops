#!/usr/bin/python3
"""
Queries the Reddit API and returns the number of subscribers for a given subreddit.
"""
import requests

def number_of_subscribers(subreddit):
    """Return the number of subscribers for a given subreddit."""
    if not subreddit or not isinstance(subreddit, str):
        return 0

    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'customUserAgent/1.0'}  # Use a custom User-Agent

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code != 200:
        return 0  # Invalid subreddit or request error

    try:
        return response.json().get("data", {}).get("subscribers", 0)
    except Exception:
        return 0
