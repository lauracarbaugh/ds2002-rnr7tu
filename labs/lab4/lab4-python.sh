#!/bin/bash     
import boto3
import requests
import os
        
#Define variables
bucket_name = "ds2002-rnr7tu
file_url = "https://www.discoverboating.com/sites/default/files/Sailboat-Types_$
file_name =  "downloaded_image.jpg"

#Fetch file
def download_file(url, file_path):
    try:
        response = requests.get(url, stream=True)
        response.raise_for_status()
        with open(file_path, 'wb') as file:
            for chunk in response.iter_content(chunk_size=8192):
                file.write(chunk)
        print(f"File downloaded to {file_path}") 
               
    except requests.exceptions.RequestException as e:
        print(f"Error downloading: {e}")
    
#Download the file
download_file(file_url, file_name)

                file.write(chunk)
        print(f"File downloaded to {file_path}") 
    except requests.exceptions.RequestException as e:
        print(f"Error downloading: {e}")
    
#Download the file
download_file(file_url, file_name)
        
#Upload to S3
s3 = boto3.client("s3")
s3.upload_file(file_name, bucket_name, file_name)
#Presign file
url = s3.generate_presigned_url(
    "get_object",
    Params={"Bucket": BUCKET_NAME, "Key": LOCAL_FILE_NAME},
    Expires=604800
        
#Output URL
print(f"Presigned URL: {url}")

