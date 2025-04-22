import os
import requests

# Path to the text file with image URLs
URLS_FILE = 'dllink.txt'
# Directory to save images
IMAGES_DIR = os.path.join('Documentation', 'images')

# Ensure the images directory exists
os.makedirs(IMAGES_DIR, exist_ok=True)

def download_images(urls_file, dest_dir):
    with open(urls_file, 'r') as f:
        for line in f:
            url = line.strip()
            if not url:
                continue
            filename = os.path.basename(url)
            dest_path = os.path.join(dest_dir, filename)
            try:
                print(f'Downloading {url}...')
                response = requests.get(url, timeout=30)
                response.raise_for_status()
                with open(dest_path, 'wb') as img_file:
                    img_file.write(response.content)
                print(f'Saved to {dest_path}')
            except Exception as e:
                print(f'Failed to download {url}: {e}')

if __name__ == '__main__':
    download_images(URLS_FILE, IMAGES_DIR)
