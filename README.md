# Terraform Stacks on Azure with CI/CD

This repository demonstrates the use of Terraform Stacks to manage Azure infrastructure with CI/CD. It includes various Terraform modules and configurations to deploy resources on Azure using Terraform Cloud.

## Repository Structure

- [`.github/workflows`](.github/workflows): Contains GitHub Actions workflows for CI/CD.
- [`.terraform`](.terraform): Contains Terraform-related files and directories.
- [`azure_identity_tf`](azure_identity_tf): Contains configurations for creating Azure service principals and federated identities.
- [`modules`](modules): Contains reusable Terraform modules for different Azure resources.
- [`components.tfstack.hcl`](components.tfstack.hcl): Defines the components and their configurations.
- [`deployments.tfdeploy.hcl`](deployments.tfdeploy.hcl): Defines the deployment configurations for different environments.

## Azure Identity Configuration

The [`azure_identity_tf`](azure_identity_tf) folder contains Terraform configurations to create service principals and federated identities for each subscription. This setup is essential for managing Azure resources securely and efficiently.

### Service Principals

For each subscription, a service principal is created. Service principals are Azure Active Directory (AAD) applications that allow Terraform to authenticate and manage resources in the subscription.

### Federated Identities

Two federated identities are created for each subscription:
1. **Plan Operation**: Used for planning Terraform changes.
2. **Apply Operation**: Used for applying Terraform changes.

These federated identities enable secure and seamless integration with Terraform Cloud, allowing Terraform to perform operations on Azure resources without storing sensitive credentials.

## Modules

The [`modules`](modules) directory contains simple Terraform modules for demo purposes. These modules define reusable configurations for various Azure resources, such as resource groups, virtual networks, subnets, storage accounts, and Windows virtual machines.

### Example Modules

- `resource_group/`: Defines a resource group.
- `virtual_network/`: Defines a virtual network.
- `subnet/`: Defines a subnet.
- `storage_account/`: Defines a storage account.
- `windows_virtual_machine/`: Defines a Windows virtual machine.

## Components Configuration

The [`components.tfstack.hcl`](components.tfstack.hcl) file defines the components and their configurations. Each component represents a specific Azure resource or a group of resources. The components are configured with inputs and providers to manage the resources.

### Example Components

- `demo_resource_group`: Creates a resource group.
- `demo_storage_account`: Creates a storage account.
- `demo_virtual_network`: Creates a virtual network.
- `demo_subnet_01`: Creates a subnet.
- `demo_windows_vm`: Creates a Windows virtual machine.

## Deployment Configuration

The [`deployments.tfdeploy.hcl`](deployments.tfdeploy.hcl) file defines the deployment configurations for different environments. It specifies the inputs and provider configurations for each deployment.

### Example Deployment

- `development`: Defines the development environment configuration, including resource group, storage account, virtual network, subnet, and Windows virtual machine.

## Understanding the Whole Picture

This repository demonstrates how to use Terraform Stacks to manage Azure infrastructure with CI/CD. By creating service principals and federated identities, we ensure secure and efficient management of Azure resources. The reusable modules and components make it easy to define and deploy infrastructure, while the deployment configurations allow for consistent and repeatable deployments across different environments.

Terraform Stacks and federated identities enable seamless integration with Terraform Cloud, allowing for secure and automated infrastructure management. This setup is ideal for organizations looking to implement infrastructure as code (IaC) and CI/CD practices for their Azure environments.