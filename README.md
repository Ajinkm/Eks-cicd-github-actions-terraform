```markdown
# 🚀 End-to-End CI/CD Pipeline for EKS using GitHub Actions & Terraform

## 📌 Overview
This project implements a fully automated CI/CD pipeline that provisions AWS infrastructure and deploys containerized applications to Amazon EKS.  

It integrates:
- GitLab (source code)
- GitHub Actions (CI/CD automation)
- Terraform (Infrastructure as Code)
- Docker (containerization)
- GitHub Container Registry (GHCR)
- Kubernetes (EKS deployment)

---

## 🧩 Problem Statement
Design a system where a developer pushes code to GitLab, triggering an automated pipeline that:
- Provisions infrastructure on AWS
- Builds and packages the application
- Pushes container images to a registry
- Deploys dynamically to Kubernetes (EKS)

---

## 🎯 Objectives

### 1. Infrastructure Provisioning (IaC)
- Provision AWS resources using Terraform:
  - VPC, Subnets, Networking
  - Amazon EKS Cluster
  - Node Groups
- Triggered via GitHub Actions

### 2. Source Code Integration
- Detect changes from GitLab
- Trigger GitHub Actions pipeline

### 3. Containerization Automation
- Auto-generate Dockerfile (if missing)
- Build Docker image

### 4. Image Management
- Push images to GHCR
- Tag images uniquely using commit SHA

### 5. Dynamic Kubernetes Deployment
- Generate deployment YAML dynamically
- Automatically use latest image tag
- No hardcoding

### 6. Continuous Deployment
- Deploy application to EKS
- Auto-update on new commits

### 7. Pipeline Orchestration
- Terraform workflow (infra)
- CI workflow (build & push)
- CD workflow (deploy)

---

## 🏗️ Architecture Flow

```

GitLab Push
↓
GitHub Actions Trigger
↓
Terraform (Provision Infra)
↓
Docker Build
↓
Push to GHCR
↓
Update Kubernetes Manifest
↓
Deploy to Amazon EKS

```

---

## 🧰 Tech Stack

| Category            | Tools Used |
|--------------------|-----------|
| Cloud              | AWS (EKS, VPC, IAM) |
| IaC                | Terraform |
| CI/CD              | GitHub Actions |
| Containerization   | Docker |
| Registry           | GHCR |
| Orchestration      | Kubernetes |
| Source Control     | GitLab + GitHub |

---

## 📂 Project Structure

```

.
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── .github/workflows/
│   ├── terraform.yml
│   ├── ci.yml
│   └── cd.yml
│
├── k8s/
│   └── deployment-template.yaml
│
├── scripts/
│   ├── generate-dockerfile.sh
│   └── update-manifest.sh
│
├── app/
│   └── app.py
│
└── README.md

````

---

## ⚙️ Workflow Breakdown

### 🏗️ Terraform Workflow (Infrastructure)
- Runs manually or on demand
- Provisions:
  - VPC
  - EKS Cluster
  - Node Groups

---

### 🔨 CI Workflow (Build & Push)
- Triggered from GitLab webhook
- Steps:
  - Generate Dockerfile (if missing)
  - Build Docker image
  - Tag image using commit SHA
  - Push to GHCR

---

### 🚀 CD Workflow (Deploy to EKS)
- Uses latest image automatically
- Dynamically updates Kubernetes manifest
- Deploys to EKS cluster using kubectl

---

## 🔐 Required GitHub Secrets

Add the following in GitHub → Settings → Secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `GHCR_TOKEN`
- `KUBE_CONFIG`

---

## 🔗 GitLab Integration

- Configure a webhook in GitLab:
  - URL: GitHub repository dispatch API
  - Event: Push events
- This triggers the GitHub Actions pipeline

---

## 🐳 Dockerfile Automation

If no Dockerfile exists, the pipeline generates one automatically using:

```bash
scripts/generate-dockerfile.sh
````

---

## 📦 Dynamic Deployment

* Kubernetes YAML is updated dynamically
* Image tag is injected automatically

---

## 🚀 How to Run

1. Clone the repository
2. Configure GitHub secrets
3. Run Terraform workflow (infra setup)
4. Connect GitLab webhook
5. Push code to GitLab
6. Pipeline executes automatically

---

## 📌 Key Highlights

* Fully automated CI/CD pipeline
* No manual infrastructure setup
* No hardcoded image versions
* Scalable and production-ready
* Supports multiple commits and deployments

---
