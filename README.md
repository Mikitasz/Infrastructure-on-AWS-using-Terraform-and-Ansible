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

![terraform drawio](https://github.com/Mikitasz/StaticWebApp-AWS-TERRAFORM-ANISBLE-NGINX/assets/94795099/8e26972a-35a2-44ae-8dab-b5a71637c8af)

## Usage Ansible

```
ansible-playbooks -i ansible/inventory/hosts (playbook)
```

## State

✅ Diagram

✅ Terraform IaC

✅ Test Terraform

❌ Readability

❌ Ansible playbooks

❌ Autoscaling group

❌ Maximum automations

❌ Test evrything

❌ Final diagram
