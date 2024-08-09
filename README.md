# Terraform Static Website

This project sets up a static website using AWS services managed by Terraform.

## Modules
- **S3 Bucket**: Hosts the static website files.
- **CloudFront**: Distributes the website globally.
- **Route 53**: Manages the DNS for the domain.
- **IAM**: Manages access permissions.
- **API Gateway**: Provides API endpoints (example setup).

## Table of Contents

- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Terraform Files](#terraform-files)
- [Deploying the Infrastructure](#deploying-the-infrastructure)
- [Cleaning Up](#cleaning-up)
- [Common Issues](#common-issues)
- [Contributing](#contributing)
- [License](#license)


## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (v0.14.0 or later)
- AWS account with appropriate permissions
- AWS CLI configured with your credentials

## Setup Instructions

1. **Clone the repository**:
   ```sh
   git clone https://github.com/Juliuszoe/static-aws-project
   cd static-aws-website

## Project Structure
   ```sh
.
├── modules
│ ├── iam
│ │ ├── main.tf
│ │ ├── outputs.tf
│ │ ├── variables.tf
│ ├── s3_bucket
│ │ ├── main.tf
│ │ ├── outputs.tf
│ │ ├── variables.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── permissions.tf
├── provider.tf
├── .gitignore
└── README.md
```

## Terraform Files

- **main.tf**: Defines the main infrastructure, including S3 bucket and CloudFront distribution.
- **variables.tf**: Contains the variables used in the Terraform scripts.
- **outputs.tf**: Specifies the outputs of the Terraform scripts.
- **permissions.tf**: Manages IAM roles and policies.
- **provider.tf**: Configures the AWS provider.


## Deploying the Infastructure
1. **Plan the deployment:**

   - **terraform plan**
   
2. **Apply the changes:**

   - **terraform apply -auto-approve**

3. **Verify the deployment:**

   - **Once the deployment is complete, you should see outputs that include the S3 bucket name and CloudFront distribution URL. Use the CloudFront URL to access your static website.**


# Common Issues
## Git Push Error Due to Large .terraform Directory
- If you encounter an error when pushing to GitHub due to the large .terraform directory, use the following command to remove the directory from your Git history:

```sh
  git filter-branch --tree-filter 'rm -rf .terraform' HEAD
```

## Pending Certificate Validation
- If your ACM certificate remains in "Pending Validation" status, ensure that your DNS records are correctly set up. You might need to manually validate the certificate in the AWS Certificate Manager.

## Contributing
- Contributions are welcome! Please fork this repository and submit a pull request with your changes.