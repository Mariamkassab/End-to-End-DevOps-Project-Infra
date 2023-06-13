# ITI-Final-Project:

* The project is about creating a private cluster and deploy Jenkins, and deploy as app using Jenkins pipeline.
* I used google cloud provider,created the infra using Terraform, and deployed Jenkins on the GKE using Ansible.


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

* run ``` gcloud compute ssh private-bastion --dry-runprivate-bastion ``` to get the "ProxyCommand"
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

## Commands to run Ansible:

* ``` mkdir jenkins ```  in the private-bastion

* run from your PC 

``` 
ansible-playbook playbook.yaml -e 'ansible_ssh_common_args="-o -<ProxyCommand>- "'  
```
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


