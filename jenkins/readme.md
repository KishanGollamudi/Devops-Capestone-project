# Jenkins CI/CD Pipeline

## Overview

Jenkins is used as the **central CI/CD orchestrator** in this DevOps platform.  
It automates the complete workflow starting from source code checkout to application deployment on a Docker host using Ansible.

This Jenkins pipeline is fully automated and triggered via **GitHub Webhooks**.

---

## Why Jenkins?

Jenkins was chosen because it provides:

- Mature CI/CD automation
- Tight integration with GitHub, Maven, Docker, SonarQube, Nexus, and Ansible
- Secure credential management
- Declarative pipeline as code (Jenkinsfile)
- Visibility into each pipeline stage with logs and status

---

## Pipeline Workflow (High-Level)

The pipeline executes the following stages sequentially:

1. **Checkout Source Code**
2. **Build & Test (Maven)**
3. **Static Code Analysis (SonarQube)**
4. **Artifact Upload (Nexus – Snapshots)**
5. **Docker Image Build**
6. **Docker Image Push (Docker Hub)**
7. **Deployment via Ansible**

Each stage is isolated, logged, and validated before moving to the next step.

---

## Jenkinsfile Location

The pipeline is defined using a **Declarative Jenkinsfile** located at:

```

jenkins/Jenkinsfile

````

This ensures:
- Version-controlled pipeline
- Reproducibility
- Easy rollback and review

---

## Detailed Pipeline Stages

### 1. Checkout

- Pulls the latest code from the GitHub repository
- Uses SCM checkout
- Triggered automatically via GitHub webhook

---

### 2. Build & Test (Maven)

- Executes:
  ```bash
  mvn clean package
````

* Compiles the Java application
* Packages the application as a WAR file
* Test reports are handled gracefully (no failure if tests are absent)

---

### 3. SonarQube Analysis

* Performs static code quality analysis
* Uses SonarQube server for:

  * Bugs
  * Vulnerabilities
  * Code smells
* Authentication is handled using a Jenkins **Secret Text credential**

---

### 4. Upload to Nexus (Snapshots)

* Publishes build artifacts to **Nexus Maven Snapshots repository**
* Uses a dynamically generated `settings.xml`
* Credentials are injected securely from Jenkins credentials store
* Ensures artifact traceability and versioning

---

### 5. Docker Image Build

* Builds a Docker image using a multi-stage Dockerfile
* The application WAR file is deployed into a Tomcat container
* Image is tagged using Jenkins `BUILD_NUMBER`

---

### 6. Docker Image Push (Docker Hub)

* Authenticates to Docker Hub using Jenkins credentials
* Pushes:

  * Versioned image (`BUILD_NUMBER`)
  * `latest` tag
* Ensures image availability for deployment

---

### 7. Deployment via Ansible

* Jenkins connects to the **Ansible Control Node** using SSH
* Triggers an Ansible playbook that:

  * Pulls the latest Docker image
  * Stops the existing container
  * Runs a new container on the Docker host
* Application becomes accessible via **Docker Host IP**

---

## Credential Management

All sensitive information is stored securely in Jenkins:

| Credential Purpose | Type                | Credential ID     |
| ------------------ | ------------------- | ----------------- |
| GitHub Access      | Username + Token    | `github-creds`    |
| SonarQube Token    | Secret Text         | `sonarqube-token` |
| Nexus Credentials  | Username + Password | `nexus-creds`     |
| Docker Hub         | Username + Password | `dockerhub-creds` |

No secrets are hardcoded in the Jenkinsfile.

---

## GitHub Webhook Integration

* Jenkins job is triggered automatically on:

  * Code push
  * Jenkinsfile update
* Webhook ensures **CI/CD automation without manual intervention**

---

## Common Issues Faced & Resolved

Some real-world issues handled during implementation:

* Maven tool misconfiguration
* Nexus credential ID mismatch
* Docker permission denied for Jenkins user
* Port conflicts during container deployment
* SSH authentication issues between Jenkins and Ansible
* SonarQube Node.js dependency warnings

All issues and fixes are documented separately in the `docs/` folder.

---

## Outcome

* Fully automated CI/CD pipeline
* Zero manual deployment steps
* Secure, scalable, and repeatable process
* Production-like DevOps workflow implemented end-to-end

---

## Screenshots

Refer to:

```
docs/screenshots/jenkins/
```

For:

* Pipeline success view
* Stage execution
* Console output
* Jenkins dashboard

```