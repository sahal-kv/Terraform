
# Terraform Project: EC2 with VPC Setup

This Terraform project automates the provisioning of an **AWS EC2 instance** within a custom **VPC**, along with the configuration of a security group to allow SSH traffic. The setup uses Terraform modules and follows a modular architecture for scalability and reusability.

---

## High-Level Architecture

1. **VPC (Virtual Private Cloud):**
   - A custom VPC is created to host the resources.
   - Includes both public and private subnets for flexible deployment.
   - Internet Gateway (IGW) is attached for internet access.
   - Route tables are configured to manage traffic between subnets and the internet.

2. **Security Group:**
   - A security group is created to define access rules for the EC2 instance.
   - Allows:
     - SSH (port 22) for secure access.
     - HTTP (port 80) and HTTPS (port 443) for web traffic.
   - Egress rules allow all outbound traffic.

3. **EC2 Instance:**
   - An EC2 instance is deployed in the VPC.
   - The instance is associated with the custom security group.
   - A pre-existing SSH key pair is used to enable secure access.
   - Instance tags are applied for identification.

4. **State Management:**
   - Terraform state is stored in a remote AWS S3 bucket for collaboration and disaster recovery.

---

## Directory Structure

Below is the directory structure for the project:

```plaintext

terraform/
│
├── envs/                       # Environment-specific configurations
│   └── prod/                   # Configuration for the production environment
│       ├── main.tf             # Entry point for defining environment-specific resources
│       ├── providers.tf        # Providers configuration (AWS)
│       ├── outputs.tf          # Outputs for the environment
│       ├── terraform.tfvars    # Environment-specific variable values
│       ├── variables.tf        # Variable definitions for the environment
|       ├── backend.tf          # Configuration for remote state storage in S3
│
├── modules/                    # Reusable Terraform modules
│   ├── ec2/                    # EC2 module
│   │   ├── main.tf             # EC2 instance and security group definition
│   │   ├── variables.tf        # Variables for EC2 module
│   │
│   ├── vpc/                    # VPC module
│       ├── main.tf             # VPC, subnets, and routing setup
│       ├── variables.tf        # Variables for VPC module
│

```

---

## How to Use

### 1. Prerequisites
- Install [Terraform](https://www.terraform.io/downloads).
- Configure AWS CLI with appropriate credentials.
- Ensure you have an existing AWS key pair for SSH access.

### 2. Initialize the Project
Navigate to the environment folder (e.g., `envs/prod`) and run:

```bash
terraform init
```

This initializes Terraform and downloads required providers and modules.

### 3. Review the Plan
Run the following command to preview the resources that will be created:

```bash
terraform plan
```

### 4. Apply the Configuration
Deploy the infrastructure by running:

```bash
terraform apply
```

You will be prompted for confirmation. Type `yes` to proceed.

### 5. Clean Up
To destroy the resources when no longer needed, run:

```bash
terraform destroy
```

---

## Key Files

### `envs/prod/main.tf`
- Defines the resources specific to the production environment, such as EC2 and VPC.

### `modules/vpc/main.tf`
- Contains reusable code for creating the VPC, subnets, route tables, and internet gateway.

### `modules/ec2/main.tf`
- Manages the EC2 instance and security group configuration.

### `backend.tf`
- Configures the remote backend to store Terraform state in an S3 bucket.

---

## Future Enhancements
- Add support for multiple environments like `dev` and `staging`.
- Integrate Terraform with CI/CD pipelines for automated deployment.
- Configure additional monitoring and logging for the EC2 instance.

---

Feel free to reach out if you have any questions or need further assistance! 🚀
