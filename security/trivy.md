# Trivy Security Scan

## Description
Trivy is used to scan Docker images for vulnerabilities.

## Command

```bash
trivy image devsecops-app
```

Purpose

Detect vulnerabilities in container images before deployment.


###  security/tfsec.md
```markdown
```

# Terraform Security Scan

## Description
tfsec is used to scan Terraform code for security issues.

## Command

```bash
tfsec terraform/
```

Purpose

Identify insecure cloud configurations.

---

```bash
markdown
```
# Project Overview

This project demonstrates a DevSecOps approach to cloud infrastructure and application deployment.

Key components:
- AWS infrastructure provisioned with Terraform
- Containerized application
- Kubernetes deployment
- CI/CD pipeline with security scanning