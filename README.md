
# EC2 Webserver

This is a simple set of files to launch an Apache web server running in an AWS EC2 instance. This approach uses a remote state which is stored inside an S3 Bucket and also a lock, for concurrency management. The lock is managed by a table in AWS Dynamo BD.

After setting up the bucket and the table, an EC2 instance will be created and a security group will be added. It allows access only on ports `443` and `80`.

Also, it sets up alarms in AWS CloudWatch for when CPU utilization reaches more than 80%. When this happens, an email is sent to a recipient using AWS SNS. Also, when the CPU level goes back to "normal", another email is sent.

Many parameters are configured using Terraform variables. Please, check all the `terraform.tfvars` files and the `dev_eucentral1/backend.tf` file to properly set your custom values.

After a successful `terraform apply`, the EC2 public IP address will be printed.

## How to run these files?

### Requeriments

Although the Terraform version wasn't enforced by any `.tf` file, using `v0.15.3` worked well.

Also, you certainly must have an AWS account. One way to make Terraform properly communicate with your account is to install the AWS CLI and run `aws configure`. Check [this guideline](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) for getting more instructions for your system.

### Steps

After checking all the `terraform.tfvars` files and the `dev_eucentral1/backend.tf` file, and update them with your custom values, you can:

1. Create the S3 bucket and the Dynamo DB table:
	```bash

	$ cd remote_state/

	$ terraform init

	$ terraform apply

	```
2. Launch the webserver:
	```bash

	$ cd ../webserver/

	$ terraform init

	$ terraform apply

	```

3. From the output of the last command, check if the webserver was launched:
	```
	$ curl <webserver_public_IP>
	```
