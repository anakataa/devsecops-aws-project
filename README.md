# DevSecOps AWS Project

##  Overview
This project demonstrates the design and implementation of a secure cloud infrastructure on AWS using DevSecOps practices.  
It includes Infrastructure as Code (Terraform), containerization, CI/CD pipelines, and security automation.

##  Architecture
- AWS VPC with public and private subnets
- EC2 instances running Docker and Kubernetes (k3s)
- Infrastructure provisioned with Terraform
- CI/CD pipeline with integrated security scanning
- Monitoring and logging

##  DevSecOps Features
- Infrastructure as Code (Terraform)
- CI/CD with GitHub Actions
- Container security scanning (Trivy)
- Infrastructure security scanning (tfsec)
- Least privilege IAM policies
- Secrets management

##  Technologies
- AWS (EC2, VPC, IAM, S3)
- Terraform
- Docker, Kubernetes (k3s)
- GitHub Actions
- Trivy, tfsec
- Linux, Bash, Python

##  Project Goals
- Build secure cloud infrastructure
- Automate deployment with CI/CD
- Integrate security into DevOps processes
- Demonstrate DevSecOps engineering skills

##  Repository Structure

devsecops-aws-project/
├── terraform/

├── app/

├── ci-cd/

├── security/

├── docs/

└── architecture/

##  Future Improvements
- Add Kubernetes deployment manifests
- Implement advanced IAM policies
- Add monitoring with Prometheus and Grafana
- Extend security automation