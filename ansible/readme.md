# Ansible – Application Deployment Automation

## 📌 Overview

This Ansible setup is used to **automate Docker-based application deployment** on a remote Docker host as part of a complete CI/CD pipeline.

It is triggered **indirectly by Jenkins** (via SSH into the Ansible control node) and performs:

* Docker installation (if required)
* Pulling the latest Docker image from Docker Hub
* Stopping and removing old containers
* Running the updated application container

This follows **Infrastructure as Code (IaC)** best practices.

---

## 🏗 Architecture Role in CI/CD

**Flow:**

```
GitHub → Jenkins → Docker Hub → Ansible → Docker Host → Application
```

* Jenkins builds and pushes the Docker image
* Jenkins SSHs into Ansible Control Node
* Ansible deploys the container on Docker Host
* Application is exposed via Docker Host IP

---

## 📂 Directory Structure

```
ansible/
├── inventory.ini
├── deploy-app.yml
├── jenkins-docker.yml
├── roles/
│   └── docker/
│       └── tasks/
│           └── main.yml
```

---

## 📄 inventory.ini

Defines target hosts grouped by role.

```ini
[jenkins]
10.0.1.230

[sonarqube]
10.0.1.67

[nexus]
10.0.1.62

[docker]
10.0.1.86

[all:vars]
ansible_python_interpreter=/usr/bin/python3
```

---

## 📄 deploy-app.yml

Deploys the application container on the Docker host.

```yaml
---
- name: Deploy OnlineBookStore Application
  hosts: docker
  become: yes

  tasks:
    - name: Pull latest Docker image
      docker_container:
        name: onlinebookstore
        image: kishangollamudi/onlinebookstore:latest
        state: started
        restart_policy: always
        ports:
          - "8081:8080"
        recreate: yes
```

---

## 📄 jenkins-docker.yml

Installs and configures Docker on the Jenkins server using Ansible.

```yaml
---
- name: Install Docker on Jenkins server
  hosts: jenkins
  become: yes
  roles:
    - docker
```

---

## 📄 roles/docker/tasks/main.yml

Installs Docker and configures permissions.

```yaml
---
- name: Install required system packages
  apt:
    name:
      - ca-certificates
      - curl
      - gnupg
      - lsb-release
      - python3-pip
    state: present
    update_cache: yes

- name: Install Docker
  apt:
    name: docker.io
    state: present

- name: Start and enable Docker
  systemd:
    name: docker
    state: started
    enabled: yes

- name: Install Docker SDK for Python
  pip:
    name: docker
    executable: pip3

- name: Add ubuntu user to docker group
  user:
    name: ubuntu
    groups: docker
    append: yes

- name: Add jenkins user to docker group
  user:
    name: jenkins
    groups: docker
    append: yes
```

---

## 🔐 SSH Prerequisites

From **Jenkins server**, passwordless SSH must work:

```bash
sudo -u jenkins ssh ubuntu@<ANSIBLE_CONTROL_IP>
```

If not configured:

```bash
sudo -u jenkins ssh-keygen
sudo -u jenkins ssh-copy-id ubuntu@<ANSIBLE_CONTROL_IP>
```

---

## ▶️ How to Run Manually (Optional)

From Ansible Control Node:

```bash
ansible-playbook -i inventory.ini deploy-app.yml
```

---

## 🌐 Application Access

After deployment, the application is accessible via:

```
http://<DOCKER_HOST_PUBLIC_IP>:8081
```

---

## ✅ Key DevOps Concepts Demonstrated

* Infrastructure as Code (IaC)
* Configuration Management with Ansible
* Dockerized application deployment
* Jenkins → Ansible integration
* Zero-downtime container redeployment
* Secure SSH-based automation

---

## 📌 Notes

* No secrets are hardcoded
* Credentials are managed in Jenkins
* Ansible is used strictly for deployment automation
* Jenkins does **not** install software directly
