# Cloud Infrastructure Portfolio (Azure & Terraform)

[![Azure Terraform CI/CD](https://github.com/PANKAJ-DEVOPS-INSIDER/cloud-infrastructure-portfolio/actions/workflows/terraform.yml/badge.svg)](https://github.com/PANKAJ-DEVOPS-INSIDER/cloud-infrastructure-portfolio/actions/workflows/terraform.yml)
![Terraform Version](https://img.shields.io/badge/Terraform-v1.x-purple?logo=terraform)
![Azure Provider](https://img.shields.io/badge/azurerm-v5.0.0-blue?logo=microsoftazure)

An enterprise-grade Infrastructure as Code (IaC) repository demonstrating modular architecture, multi-environment configuration, secure state management, and automated CI/CD pipelines on **Microsoft Azure** using **Terraform** and **GitHub Actions**.

---

## 📁 Repository Structure

```text
cloud-infrastructure-portfolio/
├── .github/
│   └── workflows/
│       └── terraform.yml          # GitHub Actions CI/CD pipeline (OIDC Auth + Plan/Apply)
├── environment/
│   └── dev/                       # Environment-specific configuration
│       ├── main.tf                # Module invocations & dependency mapping
│       ├── provider.tf            # AzureRM provider & OIDC remote backend setup
│       ├── variable.tf            # Input variable declarations
│       └── terraform.tfvars       # Environment parameter values (Dev region, RG & Storage)
├── module/                        # Reusable Terraform Modules
│   ├── resource-group/            # Module to create Azure Resource Groups dynamically
│   │   ├── main.tf
│   │   └── variable.tf
│   └── storage-account/           # Module to create Azure Storage Accounts dynamically
│       ├── main.tf
│       └── variable.tf
├── .gitignore                     # State files, logs & secrets exclusion rules
├── LICENSE                        # Project License
└── README.md                      # Project Documentation
```

---

## 🛠️ Key Features & Architecture

### 1. Modular & Dynamic Infrastructure
- **Resource Group Module (`module/resource-group`)**: Dynamic resource group provisioning using Terraform `for_each` loops.
- **Storage Account Module (`module/storage-account`)**: Configured with `depends_on` to ensure resource groups are fully created before provisioning storage services.

### 2. Secure Remote State Backend (Azure Storage + OIDC)
- State files are stored remotely in Azure Blob Storage (`container_name = "statefile"`).
- Uses **OIDC (OpenID Connect)** authentication (`use_oidc = true`) to eliminate hardcoded service principal client secrets.

### 3. Automated CI/CD Pipeline (GitHub Actions)
- **Passwordless Security**: Authenticates to Azure via OIDC (`azure/login@v2`).
- **Stage 1 (CI - Plan & Validate)**: Runs on Pull Requests & Feature branches. Formats, validates syntax, generates `tfplan`, and saves artifacts.
- **Stage 2 (CD - Approval & Apply)**: Triggers on `main` branch push. Uses GitHub Environment Protection rules (`dev-approval`) for manual approval before `terraform apply`.

---

## 🚀 Getting Started Locally

### Prerequisites
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) (v1.5+)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) (`az login`)
- An active Azure Subscription

### Deployment Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/PANKAJ-DEVOPS-INSIDER/cloud-infrastructure-portfolio.git
   cd cloud-infrastructure-portfolio/environment/dev
   ```

2. **Authenticate with Azure:**
   ```bash
   az login
   ```

3. **Initialize Terraform:**
   ```bash
   terraform init
   ```

4. **Validate and Format:**
   ```bash
   terraform fmt -check
   terraform validate
   ```

5. **Generate Execution Plan:**
   ```bash
   terraform plan
   ```

6. **Apply Infrastructure Changes:**
   ```bash
   terraform apply -auto-approve
   ```

---

## 🔐 GitHub Secrets Configuration for CI/CD

To run the GitHub Actions workflow, configure the following repository secrets under **Settings > Secrets and variables > Actions**:

| Secret Name | Description |
| :--- | :--- |
| `AZURE_CLIENT_ID` | App Registration / Managed Identity Client ID |
| `AZURE_TENANT_ID` | Azure Active Directory Tenant ID |
| `AZURE_SUBSCRIPTION_ID` | Target Azure Subscription ID |

---

## 📝 Author & Maintainer
Created with ❤️ for DevOps & Cloud Architecture practice.
