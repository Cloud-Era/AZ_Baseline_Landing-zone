# Azure Config Store

This repository contains Terraform scripts to set up and manage an Azure configuration store with a structured deployment process using GitHub Actions.

## Project Structure

```plaintext
azure-config-store/
├── .github/
│   └── workflows/
│       └── deploy.yml
├── terraform/
│   ├── backend_config.tf
│   ├── main.tf
│   ├── locals.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── modules/
│       ├── resource_group/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── virtual_network/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       └── subnet/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
└── azure-config.json
