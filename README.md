```markdown
# CloudUploader

CloudUploader is a bash-based CLI tool that allows users to quickly upload files to a specified AWS S3 bucket, providing a simple and seamless upload experience similar to popular storage services.

## Features

- Upload files to an AWS S3 bucket.
- Check if the file exists before uploading.
- Validate the existence of the specified S3 bucket and directory.
- Check for internet connectivity before attempting the upload.
- Prompt the user for inputs with a limited number of retries.

## Prerequisites

- Bash shell.
- AWS CLI installed and configured with appropriate permissions.
- Internet connection.

## Installation

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/Nosa47/clouduploader.git
    ```

2. Navigate to the project directory:

    ```bash
    cd CloudUploader
    ```

3. Make the script executable:

    ```bash
    chmod +x clouduploader.sh
    ```

4. Optionally, add the script to your `$PATH` for easier access:

    ```bash
    echo 'export PATH=$PATH:/path/to/CloudUploader' >> ~/.bashrc
    source ~/.bashrc
    ```

## Usage

Run the `clouduploader.sh` script:

```bash
./clouduploader.sh
```

### Example Interaction

1. Run the `clouduploader` command:

    ```bash
    ./clouduploader.sh
    ```

2. If there is no internet connection, it will display:

    ```bash
    Error: No internet connection.
    ```

3. If the internet connection is available, the script will prompt for the file directory:

    ```bash
    Enter the file directory: /path/to/file.txt
    ```

4. If the file does not exist:

    ```bash
    Error: file.txt doesn't exist.
    ```

5. If the file exists, it will prompt for the S3 bucket name:

    ```bash
    Enter the S3 bucket name: my-bucket
    ```

6. If the S3 bucket does not exist:

    ```bash
    Error: 'my-bucket' doesn't exist.
    ```

7. It will prompt again for the S3 bucket name (up to 3 attempts).

8. If the S3 bucket exists, it will prompt for the S3 directory:

    ```bash
    Enter the S3 directory (path): my-directory
    ```

9. If the S3 directory does not exist:

    ```bash
    Error: 'my-bucket/my-directory' doesn't exist.
    ```

10. It will prompt again for the S3 directory (up to 3 attempts).

11. If the S3 directory exists, it will prompt for the storage class:

    ```bash
    Enter the storage class (e.g., STANDARD, STANDARD_IA, etc.): STANDARD
    ```

12. It will show the upload process and completion message:

    ```bash
    Uploading...
    upload: /path/to/file.txt to s3://my-bucket/my-directory/file.txt
    Upload completed.
    ```

13. If there is an error during upload:

    ```bash
    Error: Failed to upload file.txt to s3://my-bucket/my-directory
    ```

## Common Issues

### No Internet Connection

If you see the message `Error: No internet connection.`, ensure that your internet connection is active and try again.

### File Does Not Exist

If you see the message `Error: file.txt doesn't exist.`, ensure that the file path you provided is correct.

### S3 Bucket or Directory Does Not Exist

If you see messages indicating that the S3 bucket or directory does not exist, ensure that the names you provided are correct and that they exist in your AWS account.

## License

This project is licensed under the MIT License.
```

### Save and Commit

Save this content in a file named `README.md` in your project's root directory. Then commit the updated README to your GitHub repository:

```bash
git add README.md
git commit -m "Update README.md with installation and usage instructions"
git push origin main
```

