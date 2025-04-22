import os
import re
import urllib.parse  # Added for URL encoding

def find_markdown_files(directory):
    """Recursively find all Markdown files in the given directory."""
    markdown_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".md"):
                markdown_files.append(os.path.join(root, file))
    return markdown_files

def extract_links(markdown_file):
    """Extract all Markdown links from a file."""
    with open(markdown_file, 'r', encoding='utf-8') as file:
        content = file.read()
    # Match Markdown links: [text](link)
    return re.findall(r'\[.*?\]\((.*?)\)', content)

def check_links(markdown_file, links):
    """Check if the links exist relative to the parent Markdown file."""
    broken_links = []
    parent_directory = os.path.dirname(markdown_file)
    for link in links:
        # Ignore external links (starting with http or https)
        if link.startswith("http://") or link.startswith("https://"):
            continue
        # Decode %20 to spaces for file system comparison
        decoded_link = urllib.parse.unquote(link)
        # Resolve relative paths based on the parent Markdown file
        full_path = os.path.join(parent_directory, decoded_link)
        if not os.path.exists(full_path):
            broken_links.append(link)
    return broken_links

def main():
    base_directory = "/Users/eric/Documents/GitHub/4D-Widgets"
    markdown_files = find_markdown_files(base_directory)
    all_broken_links = {}

    for markdown_file in markdown_files:
        links = extract_links(markdown_file)
        broken_links = check_links(markdown_file, links)  # Pass the current Markdown file
        if broken_links:
            all_broken_links[markdown_file] = broken_links

    if all_broken_links:
        print("Broken links found:")
        for file, links in all_broken_links.items():
            print(f"\nIn file: {file}")
            for link in links:
                print(f"  - {link}")
    else:
        print("No broken links found.")

if __name__ == "__main__":
    main()
