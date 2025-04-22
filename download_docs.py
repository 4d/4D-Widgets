#!/usr/bin/env python3
"""
Script to download 4D documentation pages from URLs listed in instru.md.
Usage: python download_docs.py path/to/instru.md
"""

import os
import sys
import re
import requests
from urllib.parse import urlparse
import time
from pathlib import Path

def create_directory(directory):
    """Create directory if it doesn't exist"""
    if not os.path.exists(directory):
        os.makedirs(directory)
        print(f"Created directory: {directory}")

def sanitize_filename(url):
    """Create a valid filename from the URL"""
    # Get the path portion of the URL and replace slashes with underscores
    parsed_url = urlparse(url)
    path = parsed_url.path
    
    # Remove the first slash if it exists
    if path.startswith('/'):
        path = path[1:]
    
    # Replace slashes with underscores
    filename = path.replace('/', '_')
    
    # Add the URL domain as a prefix to ensure uniqueness
    domain = parsed_url.netloc
    
    return f"{domain}_{filename}"

def download_page(url, save_dir, index):
    """Download a web page and save it to the specified directory"""
    try:
        # Create a sanitized filename
        filename = sanitize_filename(url)
        save_path = os.path.join(save_dir, filename)
        
        # Make request to the URL
        print(f"[{index}] Downloading: {url}")
        response = requests.get(url, timeout=30)
        
        # Check if request was successful
        if response.status_code == 200:
            # Save the content
            with open(save_path, 'wb') as f:
                f.write(response.content)
            print(f"Saved to: {save_path}")
            return True
        else:
            print(f"Error downloading {url}: Status code {response.status_code}")
            return False
    except Exception as e:
        print(f"Error downloading {url}: {e}")
        return False

def main():
    # Check if the filename was provided as an argument
    if len(sys.argv) < 2:
        print("Usage: python download_docs.py path/to/instru.md")
        sys.exit(1)
    
    instru_file = sys.argv[1]
    
    # Check if the file exists
    if not os.path.isfile(instru_file):
        print(f"Error: File '{instru_file}' does not exist.")
        sys.exit(1)
    
    # Create the scrap directory
    script_dir = os.path.dirname(os.path.realpath(__file__))
    scrap_dir = os.path.join(script_dir, "scrap")
    create_directory(scrap_dir)
    
    # Regular expression to extract URLs from each line of the file
    url_pattern = r'https?://[^\s|]+'
    
    # Read the file and extract URLs
    urls = []
    with open(instru_file, 'r') as file:
        for line in file:
            match = re.search(url_pattern, line)
            if match:
                url = match.group(0)
                urls.append(url)
    
    # Download each URL
    print(f"Found {len(urls)} URLs to download")
    successful_downloads = 0
    
    for i, url in enumerate(urls, 1):
        if download_page(url, scrap_dir, i):
            successful_downloads += 1
        
        # Add a small delay to avoid overwhelming the server
        if i < len(urls):
            time.sleep(0.5)
    
    print(f"\nDownload complete: {successful_downloads} of {len(urls)} files downloaded successfully")
    print(f"Files saved to: {scrap_dir}")

if __name__ == "__main__":
    main()