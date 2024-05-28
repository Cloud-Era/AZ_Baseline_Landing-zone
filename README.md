# Azure Infrastructure Terraform

This repository contains Terraform configurations for deploying Azure infrastructure.

## Folder Structure

- `.github/workflows`: Contains GitHub Actions workflows.
- `environments`: Contains environment-specific Terraform configurations.
- `modules`: Contains reusable Terraform modules.
- `.gitignore`: Specifies intentionally untracked files to ignore.
- `README.md`: Provides an overview of the repository.

## Usage

1. Update Azure credentials in GitHub Secrets.
2. Modify Terraform configurations as needed.
3. Commit and push changes to trigger GitHub Actions workflows for deploying infrastructure.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.







azure-config-store/
├── .github/
│   └── workflows/
│       └── deploy.yml
├── environments/
│   ├── dev/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   └── variables.tf
│   ├── prod/
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   └── variables.tf
│   └── stage/
│       ├── backend.tf
│       ├── main.tf
│       └── variables.tf
├── modules/
│   ├── landing_zone/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── network/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── rbac/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── .gitignore
└── README.md
