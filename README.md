# [StaticWebApp-AWS-TERRAFORM-ANISBLE](https://github.com/Mikitasz/StaticWebApp-AWS-TERRAFORM-ANISBLE)

## Usage

Create file `<name>`.tfvars in main folder. Add next params (But before create User in AWS using AMI):

```
access_key=""
secret_key=""
```

To user run

```
terraform init
terraform plan / apply / destroy -var-file=<name>.tfvars
```

![Untitled Diagram (1)](https://github.com/Mikitasz/StaticWebApp-AWS-TERRAFORM-ANISBLE/assets/94795099/1b646a61-0068-4519-9da6-f4284ecfc662)
