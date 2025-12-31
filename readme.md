# DevOps Platform Capstone Project

## Project Overview
This project implements an end-to-end CI/CD platform using industry-standard DevOps tools.
The goal is to automate code quality checks, builds, artifact management, containerization,
and image distribution with full traceability.

## Toolchain
- GitHub – Source control & trigger
- Terraform – Infrastructure provisioning
- Ansible – Configuration management
- Jenkins – CI/CD orchestration
- SonarQube – Static code analysis & quality gates
- Nexus Repository – Artifact storage
- Docker & Docker Compose – Containerization
- Docker Hub – Image registry

## Architecture Flow
GitHub → Jenkins → SonarQube → Maven/NPM → Nexus → Docker → Docker Hub

## Design Principles
- No manual server configuration
- No UI-based infrastructure creation
- No secrets in code
- Everything is reproducible and automated

## Kubernetes Decision
Kubernetes is intentionally excluded from this project.
Docker Compose is used for service orchestration to keep the platform simple,
cost-effective, and aligned with the project scope.

## Ownership & Standards
Each tool has a clear responsibility:
- Terraform provisions infrastructure
- Ansible configures software
- Jenkins orchestrates pipelines
- Docker packages applications

## Repository Structure
terraform/  – Infrastructure as Code  
ansible/    – Configuration management  
jenkins/    – CI/CD pipeline definitions  
app/        – Sample application  
docs/       – Documentation & evidence  
