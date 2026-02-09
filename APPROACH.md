# Approach

This document explains the rationale behind the infrastructure design, tools, and technologies chosen for this project.

---

## Infrastructure Design Rationale

### 1. AWS Cloud Platform
AWS was selected because it is an industry-standard cloud provider and offers reliable, scalable, and well-documented services. It is commonly used in production environments and aligns well with DevOps best practices.

AWS RESOURCES
-  Virtual Private Cloud (VPC)
-  Public Subnet
-  EC2 Instance (Ubuntu 22.04, t2.micro)
-  Security Groups


## 2.Containerization Strategy

- Docker

## 3.Infrastructure as Code (Terraform)

- Terraform

---

## 4.CI Pipeline (GitHub Actions)

---

## Overall Design Philosophy

The overall approach prioritizes:
- Simplicity
- Automation
- Industry best practices


The architecture is intentionally minimal but extensible for future enhancements such as private subnets, load balancers, or auto-scaling.
