# Application – Online Bookstore

## Overview

This folder contains the **application source code** used in the DevOps Platform Capstone project.

The application is a **Java-based Online Bookstore** packaged as a **WAR file** and deployed on **Apache Tomcat** inside a Docker container.  
It is designed to demonstrate a **realistic CI/CD workflow** rather than application complexity.

---

## Application Technology Stack

- **Language:** Java (JDK 17)
- **Build Tool:** Maven
- **Packaging:** WAR
- **Web Server:** Apache Tomcat 10
- **Containerization:** Docker

---

## Purpose of This Application

The application serves as a **deployment artifact** to validate:

- Maven build and packaging
- Code quality analysis using SonarQube
- Artifact storage in Nexus
- Docker image creation
- Automated deployment using Ansible
- End-to-end CI/CD automation via Jenkins

---

## Project Structure

Typical structure inside this folder:

app/
├── src/
│ └── main/
│ ├── java/
│ ├── resources/
│ └── webapp/
├── pom.xml
├── Dockerfile
└── README.md

yaml
Copy code

---

## Build Process

The application is built using Maven:

```bash
mvn clean package
This produces:

bash
Copy code
target/onlinebookstore.war
The WAR file is used in:

Nexus artifact upload

Docker image creation

Docker Image Build
A multi-stage Dockerfile is used:

Builder Stage

Uses Maven image

Builds the WAR file

Runtime Stage

Uses Tomcat image

Deploys the WAR as ROOT.war

This ensures:

Smaller final image

Clean separation of build and runtime layers

Application Deployment
The application is deployed as a Docker container:

Container Port: 8080

Host Port: Exposed by Docker host

Access URL:

php-template
Copy code
http://<DOCKER_HOST_IP>:<HOST_PORT>
Deployment is fully automated via Ansible, triggered from Jenkins.

CI/CD Integration
This application is tightly integrated into the CI/CD pipeline:

Stage	Tool
Source Control	GitHub
Build	Maven
Quality Scan	SonarQube
Artifact Repository	Nexus
Containerization	Docker
Deployment	Ansible
Orchestration	Jenkins

Versioning Strategy
Maven uses SNAPSHOT versions during development

Docker images are tagged with:

Jenkins BUILD_NUMBER

latest for active deployment

