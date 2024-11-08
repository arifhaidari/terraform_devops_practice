# Terraform DevOps Practices

This project is part of an exam for the **DataScientest Bootcamp** and serves as a practical exercise to deepen knowledge of **Terraform** and essential **DevOps** skills. Here, Terraform—a cloud-agnostic infrastructure-as-code (IaC) tool—was used to automate the deployment of a Virtual Private Cloud (VPC) and supporting infrastructure components on AWS. This setup includes VPC, subnets, NAT gateway, an Application Load Balancer (ALB), EC2 instances, an RDS database, and a bastion host, demonstrating a comprehensive cloud environment.

## Project Purpose

The project’s purpose is to:

- Practice creating infrastructure in a reproducible, automated way using **Terraform**.
- Understand cloud infrastructure components and their relationships within a DevOps context.
- Implement a project with reusable modules for components like VPC, subnets, and security groups.
- Gain experience with infrastructure configurations, security, and network design.

## Prerequisites

1. **Terraform**: Install Terraform by following the [Terraform installation guide](https://developer.hashicorp.com/terraform/downloads).
2. **AWS CLI**: Configure AWS CLI to authenticate Terraform with AWS. Run:
   ```bash
   aws configure
   ```
3. **AWS IAM Permissions**: Ensure the AWS account has sufficient permissions to create VPC, subnets, NAT gateways, load balancers, EC2 instances, and RDS instances.

## Project Structure

The project is organized using a modular approach, where each major infrastructure component is defined as a module. Here’s a breakdown of the main modules:

- **VPC Module**: Creates a VPC and CIDR block.
- **Subnet Module**: Defines public and private subnets within the VPC.
- **NAT Gateway Module**: Creates a NAT gateway for secure outbound traffic from private subnets.
- **ALB Module**: Deploys an Application Load Balancer and attaches it to the public subnets.
- **EC2 Module**: Provisions EC2 instances within the private subnets.
- **RDS Module**: Configures an RDS instance in the private subnet.
- **Bastion Host Module**: Sets up a bastion host in the public subnet for secure access to the private network.

## Configuration

In this project, you will find:

- **Main.tf**: Core configuration where modules are instantiated.
- **Variables.tf**: Defines input variables required by the modules (e.g., CIDR blocks, instance types, AMI IDs).
- **Outputs.tf**: Defines outputs to retrieve key values after infrastructure deployment.

### Notable Terraform Configurations

Some configurations required special handling:

1. **Security Group Dependencies**:
   Security groups for ALB, EC2, RDS, and bastion host were defined separately in the root module due to dependencies between resources.

2. **Deprecated Arguments**:
   Updated the `aws_eip` resource in the NAT gateway module to use `domain = "vpc"` instead of the deprecated `vpc = true`.

3. **Input Variables**:
   Added input variables such as `bastion_instance_type` and `vpc_id` to modules that required these inputs but did not have them defined by default.

### Variable Examples

Define these variables to customize your setup:

```hcl
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}
```

## Deployment Instructions

1. **Initialize Terraform**:
   Run `terraform init` in the project’s root directory to download module dependencies.

2. **Validate Configuration**:
   Run `terraform validate` to check for syntax errors or configuration issues.

3. **Plan and Apply**:

   - Generate an execution plan to preview infrastructure changes:
     ```bash
     terraform plan
     ```
   - Apply the configuration to create the resources:
     ```bash
     terraform apply
     ```

4. **Destroy Resources**:
   Run `terraform destroy` when done to clean up resources and avoid unnecessary charges.

## Example Output

The output from Terraform will display key information, such as the ALB DNS name and RDS endpoint, to verify and connect to the deployed resources.

## Issues & Solutions

1. **Security Groups Not Declared**: Several modules referenced undeclared security groups. These were resolved by defining required security groups (`alb_sg`, `ec2_sg`, `rds_sg`, `bastion_sg`) directly in the root module.

2. **Deprecated Arguments**: The `vpc` argument in `aws_eip` was replaced with the `domain` attribute to resolve deprecation warnings.

3. **Missing Variables**: Added missing variables such as `bastion_instance_type` to enable flexible configuration.

## Key Takeaways

This project demonstrates the creation of a scalable, secure cloud infrastructure with Terraform. Key learning points include:

- Modularizing infrastructure components for reusability.
- Working with Terraform's syntax, variable declarations, and output retrieval.
- Using Terraform to define security rules and network configurations.

## License

This project is for educational purposes and part of an exam within the DataScientest Bootcamp program.
