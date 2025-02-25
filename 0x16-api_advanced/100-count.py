#!/usr/bin/python3
"""
Recursively queries the Reddit API, parses hot article titles,
and counts keyword occurrences.
"""
import requests


def count_words(subreddit, word_list, counts={}, after=None):
    """Recursively queries the Reddit API, parses titles of hot articles,
    and counts occurrences of given keywords.

    Args:
        subreddit (str): The subreddit name.
        word_list (list): List of keywords to count.
        counts (dict): Dictionary storing word counts (default empty).
        after (str): The pagination token.

    Returns:
        None: Prints the sorted word count.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "MyRedditClient/1.0"}
    params = {"limit": 100, "after": after}

    response = requests.get(url, headers=headers, params=params, allow_redirects=False)

    if response.status_code != 200:
        return

    data = response.json().get("data", {})
    children = data.get("children", [])

    # Normalize word list (case-insensitive)
    word_list = [word.lower() for word in word_list]

    # Initialize counts dict (if first call)
    if not counts:
        counts = {word: 0 for word in word_list}

    # Count occurrences of each keyword in post titles
    for post in children:
        title_words = post["data"]["title"].lower().split()
        for word in title_words:
            if word in counts:
                counts[word] += 1

    # Pagination handling: Recursive call if 'after' is not None
    after = data.get("after")
    if after:
        return count_words(subreddit, word_list, counts, after)

    # Print the sorted results after recursion completes
    sorted_counts = sorted(
        [(word, count) for word, count in counts.items() if count > 0],
        key=lambda x: (-x[1], x[0])  # Sort by count DESC, then alphabetically
    )

    for word, coun
