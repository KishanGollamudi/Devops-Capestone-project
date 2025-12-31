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

## Screenshots 
<img width="1920" height="1080" alt="23" src="https://github.com/user-attachments/assets/b96ba20d-27cc-46d7-a2e4-1077dc304639" />
<img width="1920" height="1080" alt="22" src="https://github.com/user-attachments/assets/1bd6c728-5388-4ab2-88a6-74dd33e2ec16" />
<img width="1920" height="1080" alt="21" src="https://github.com/user-attachments/assets/fc2a0833-13f8-482f-bb0e-3d19e8a56917" />
<img width="1920" height="1080" alt="20" src="https://github.com/user-attachments/assets/3a534182-8414-4eaf-aca9-113e850417fa" />
<img width="1920" height="1080" alt="19" src="https://github.com/user-attachments/assets/a1b88b63-56f3-437f-8507-22b75fe853dd" />
<img width="1920" height="1080" alt="18" src="https://github.com/user-attachments/assets/50541901-5abc-4a0b-bc36-be64ce9ae19a" />
<img width="1920" height="1080" alt="17" src="https://github.com/user-attachments/assets/3830a323-42fb-41c4-9320-c46d7c8f24a5" />
<img width="1920" height="1080" alt="16" src="https://github.com/user-attachments/assets/3880654d-5434-47c4-b97b-d3af1a3fbd76" />
<img width="1920" height="1080" alt="15" src="https://github.com/user-attachments/assets/9f29a362-8e26-46cc-85dd-732e77344c03" />
<img width="1920" height="1080" alt="14" src="https://github.com/user-attachments/assets/f80277d5-4086-4d62-bbb4-fdc64f2af01d" />
<img width="1920" height="1080" alt="13" src="https://github.com/user-attachments/assets/21841e22-492a-464b-992e-c9277a56671f" />
<img width="1920" height="1080" alt="12" src="https://github.com/user-attachments/assets/43be57b9-0c6e-4f30-a3ad-1edec91e265c" />
<img width="1920" height="1080" alt="11" src="https://github.com/user-attachments/assets/2167133e-84d7-45dc-aa95-5d4553b34278" />
<img width="1920" height="1080" alt="10" src="https://github.com/user-attachments/assets/e6c6426f-cceb-4077-8880-e9cc66bbea03" />
<img width="1920" height="1080" alt="9" src="https://github.com/user-attachments/assets/df0b460f-289b-48bb-823f-47a3c2226143" />
<img width="1920" height="1080" alt="8" src="https://github.com/user-attachments/assets/1ae8d2d1-99f9-4d7d-afe9-7a9379b1dbca" />
<img width="1920" height="1080" alt="7" src="https://github.com/user-attachments/assets/e285d657-de4b-4a9b-a113-641059735ec7" />
<img width="1920" height="1080" alt="6" src="https://github.com/user-attachments/assets/8ecd99a9-abfb-41f0-ab37-86a3ed94c08f" />
<img width="1920" height="1080" alt="5" src="https://github.com/user-attachments/assets/d18e6154-e66f-4a4f-b4ec-f5cd8a93494c" />
<img width="1920" height="1080" alt="4" src="https://github.com/user-attachments/assets/52b6e0fe-3b78-4694-bc95-fec330441e8a" />
<img width="1920" height="1080" alt="3" src="https://github.com/user-attachments/assets/01b7fc45-48ee-4f96-9286-7d59e3e7e464" />
<img width="1920" height="1080" alt="2" src="https://github.com/user-attachments/assets/57c4c854-31ac-4768-90b6-a17f57b60e47" />
<img width="1920" height="1080" alt="1" src="https://github.com/user-attachments/assets/9fa5f3f6-cc4d-4316-a4c1-8d06880710e2" />

