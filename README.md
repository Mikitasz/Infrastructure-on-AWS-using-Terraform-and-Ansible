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
