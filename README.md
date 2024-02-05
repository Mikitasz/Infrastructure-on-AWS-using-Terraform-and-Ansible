# [StaticWebApp-AWS-TERRAFORM-ANISBLE](https://github.com/Mikitasz/StaticWebApp-AWS-TERRAFORM-ANISBLE)

## Usage Terraform

Create file `<name>`.tfvars in main folder. Add next params (But before create User in AWS using AMI, shoud have access to EC2, VPC, SG):

```
access_key="your_value"
secret_key="your_value"
```

To user run

```
terraform init
terraform plan / apply / destroy -var-file=<name>.tfvars
```


<img width="631" alt="s" src="https://github.com/Mikitasz/StaticWebApp-AWS-TERRAFORM-ANISBLE-NGINX/assets/94795099/24133ce8-8594-4b13-8260-8134d0e65389">

![Untitled Diagram drawio (8)](https://github.com/Mikitasz/StaticWebApp-AWS-TERRAFORM-ANISBLE-NGINX/assets/94795099/b256735d-f08f-4a0a-becf-343687a3d2aa)

## Usage Ansible

```
ansible-playbooks -i ansible/inventory/hosts ansible/web.yaml
```

## State

✅ Diagram

✅ Terraform IaC

✅ Test Terraform

❌ Readability

✅ Ansible playbooks

❌ Autoscaling group

❌ Maximum automations

❌ Test evrything

✅ Final diagram
