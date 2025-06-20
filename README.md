# TF-opella-challenge
✅ Project Overview

📦 Folder Structure

⚙️ GitHub Actions with Dev & Prod environments

🔐 Secrets & Environment Setup

🚀 Deployment Steps

🧩 Terraform Module Reuse
🚀 Azure Infrastructure Deployment using Terraform & GitHub Actions
This project showcases infrastructure-as-code (IaC) using Terraform to provision Azure resources across multiple environments (Dev & Prod) using GitHub Actions CI/CD with manual approval gates for production.

🧱 Features
🔁 Reusable Terraform module for Virtual Network

🔐 Azure Storage Account connected to subnet

🔄 GitHub Actions with:

deploy-dev: auto-apply

deploy-prod: manual approval before apply

🔧 Environment-specific configurations via terraform.tfvars

✅ Modular folder structure for clean scalability
📁 Project Structure
css
Copy
Edit
```
terraform-opella-challenge/
├── modules/
│   └── vnet/                # Reusable VNet module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── terraform.tfvars
└── .github/
    └── workflows/
        └── deploy.yaml       # CI/CD workflow
 🔧 GitHub Environments
```
Create these environments in your GitHub repo for approval workflows:

dev – No approval required

prod – Add reviewers for manual approval

Go to: Repo > Settings > Environments → Add prod → Set required reviewers.
🔐 GitHub Secrets
Secret Name	Used By	Description
AZURE_CREDENTIALS	deploy-dev&deploy-dev	JSON from Azure SP (Dev)
Generate via:
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/..."
🚀 Workflow Steps (from deploy.yaml)
✅ Dev Stage
Runs terraform init, plan, and apply on environments/dev

Auto-applies changes

🔐 Prod Stage
Waits for manual approval via GitHub UI

Applies to environments/prod after confirmation
🧩 Reusable VNet Module
Supports:

Custom name/address space

Multiple subnets

Outputs: vnet_id, subnet_ids
🔐 The Pipeline output
🧩Workflow link
[Opell-Infra_Deploymen](https://github.com/ramakrishnadandu/tf-opella-challenge/actions/runs/15774805490)
![image](https://github.com/user-attachments/assets/890a125f-a13e-4c75-9150-d08255e5a72f)

![image](https://github.com/user-attachments/assets/5a8ca4d0-c7d7-4f39-aa2f-f3dff7f74969)
![image](https://github.com/user-attachments/assets/20060672-c7cb-4bcd-8c73-54ea9bb2a0f0)

✅ Resource in  Dev Environment(Azure)
![image](https://github.com/user-attachments/assets/844e1b08-5e6f-46b0-a37e-03af8e1f8d07)


✅ Resource in  Prod Environment(Azure)
![image](https://github.com/user-attachments/assets/41380d3c-0744-4699-91a8-20f85650f8c3)




        
