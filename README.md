# ITI-Final-Project:

* The project is about creating a private cluster and deploy Jenkins, and deploy as app using Jenkins pipeline.
* I used google cloud provider,created the infra using Terraform, and deployed Jenkins on the GKE using Ansible.
* The [Infra repo](https://github.com/Mariamkassab/ITI-Final-Project-Infra)
* The [APP repo](https://github.com/Mariamkassab/ITI-Final-project-APP)

## Terraform components: 

* VPC
* Two subnets one for GKE and the other for the private-bastion
* GKE cluster
* IAP
* NAT Gatway and Router 
* Service Account 
* private-bastion wuth its automation file
---
![Cloud Architecture - Page 1 (1)](https://github.com/Mariamkassab/ITI-Final-Project-Infra/assets/123699968/9db1df4a-99b9-4c6f-b6ad-cf75071b4e2e)

---

## Commands to run Terraform:
```
terraform init
```
```
terraform plan
```
```
terraform apply
```

* run ``` gcloud compute ssh private-bastion --dry-run private-bastion ``` to get the "ProxyCommand"
* run ``` ssh-keygen -t rsa ``` to generate a keypair
* then ssh to the private-bastion
* copy the pub key and paste it in the private-bastion in path: "/home/user/.ssh/authorized_keys"


## Commands to connect the private-bastion to the GKE:
``` 
gcloud auth login
``` 
```
gcloud container clusters get-credentials <cluster_name> --zone <zone> --project <project_name>
```
---
## Create jenkins slave image with all its dependances:

* on dockerhub   ```  mariamkasssab/jenkins_slave:v3  ```

## Commands to run Ansible:

* ``` mkdir jenkins ```  in the private-bastion

* run from your PC 

``` 
ansible-playbook playbook.yaml -e 'ansible_ssh_common_args="-o -<ProxyCommand>- "'  
```
---
## Commands on the jenkins salve pod:
* ```passwd jenkins```  to reset the password we will use on jenkins.
*  ``` chmod 777 /var/run/docker.sock ```
* ``` service ssh start ```
* then,
``` 
gcloud auth login
``` 
```
gcloud container clusters get-credentials <cluster_name> --zone <zone> --project <project_name>
```
---
![2](https://github.com/Mariamkassab/ITI-Final-project-APP/assets/123699968/7b9edd96-b707-45d1-9c2b-76f48775b203)

---
![1](https://github.com/Mariamkassab/ITI-Final-project-APP/assets/123699968/5c8ca49f-c345-465b-92de-843dd257c4d5)

---
![3](https://github.com/Mariamkassab/ITI-Final-project-APP/assets/123699968/942c5208-3ee0-4466-ba8a-2ebed50f633f)

---
![4](https://github.com/Mariamkassab/ITI-Final-project-APP/assets/123699968/6290cbe3-c933-4007-8bd9-ed00eacf1492)

---

![Ansible](https://github.com/Mariamkassab/ITI-Final-Project-Infra/assets/123699968/21481008-8664-444d-8ead-4fd82f121d8e)

---

![image](https://github.com/Mariamkassab/ITI-Final-Project-Infra/assets/123699968/4f27353f-6063-490f-afa9-3e3f1f5513a6)

---

![image](https://github.com/Mariamkassab/ITI-Final-Project-Infra/assets/123699968/e47ac916-eaa7-4ee8-a6e0-f94cc6b2cbe0)

