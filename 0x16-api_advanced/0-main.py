#!/usr/bin/python3
"""Test script for API project"""

import sys
from subs import number_of_subscribers  # Updated module name

if __name__ == "__main__":
    subreddit = sys.argv[1]
    print(number_of_subscribers(subreddit))
