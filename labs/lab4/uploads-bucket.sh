#!/bin/bash

LOCAL_FILE=$1
BUCKET=$2
EXPIRATION=$3

#Upload file to bucket
aws s3 cp "$LOCAL_FILE" "s3://$BUCKET/$LOCAL_FILE"

#Presign URL
aws presign "s3://$BUCKET/$LOCAL_FILE" --expires-in "$EXPIRATION"

