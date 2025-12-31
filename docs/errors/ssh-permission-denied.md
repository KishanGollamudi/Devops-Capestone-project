# SSH Permission Denied (Jenkins → Ansible)

## Problem

Jenkins was unable to SSH into the Ansible control node:

Permission denied (publickey)

yaml
Copy code

---

## Root Cause

- Jenkins runs as the `jenkins` user
- SSH keys were generated for `ubuntu`, not `jenkins`
- The Ansible control node did not trust Jenkins' SSH key

---

## Debugging Steps

Checked Jenkins SSH directory:

```bash
sudo -u jenkins ls -l /var/lib/jenkins/.ssh
Generated SSH key for Jenkins user:

bash
Copy code
sudo -u jenkins ssh-keygen
Copied key to Ansible control node:

bash
Copy code
sudo -u jenkins ssh-copy-id ubuntu@<ANSIBLE_IP>
Resolution
Jenkins user can now SSH into Ansible without password

Ansible playbooks can be triggered remotely via Jenkins

Outcome
Pipeline deployment stage executed successfully using Ansible.

yaml
Copy code

---
