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



=============================================================================================================================================================================================
=============================================================================================================================================================================================
=============================================================================================================================================================================================
=============================================================================================================================================================================================
=============================================================================================================================================================================================
====================
.
├── .github
│   └── workflows
│       └── deploy.yml
├── environments
│   ├── dev
│   │   ├── main.tf
│   │   ├── backend.tf
│   │   └── variables.tf
│   ├── prod
│   │   ├── main.tf
│   │   ├── backend.tf
│   │   └── variables.tf
│   └── stage
│       ├── main.tf
│       ├── backend.tf
│       └── variables.tf
├── modules
│   ├── landing_zone
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── network
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── rbac
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── main.tf
├── providers.tf
└── variables.tf

