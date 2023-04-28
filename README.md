# Creating a 3-tier Environment on Azure using Terraform
This guide explains how to use Terraform to create a 3-tier environment on Azure. The environment includes an application tier, a web tier, and a data tier, each with their own virtual machines and load balancers. The steps outlined here are high-level and may need to be customized based on your specific requirements.

## Prerequisites

Before you start, you need to have the following:

* An Azure account
* The Azure CLI installed
* Terraform installed

1. Define the Azure provider and authenticate Terraform with your Azure account.
    * Please refer to [01-provider.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/01-provider.tf) for terraform code.
2. Create a resource group for your environment.
3. Create a virtual network with three subnets: app, web, and data.
4. Create network security groups for each subnet to control inbound and outbound traffic.
5. Provision virtual machines for each tier using a custom script extension to install required software and configure the machine.
6. Configure load balancers for the app and web tiers to distribute traffic and increase availability.
7. Create a backend pool for the app tier load balancer, and associate it with the virtual machines created in step 5.
8. Create a frontend IP configuration and associate it with the app tier load balancer.
9. Create a health probe for the app tier load balancer to ensure that requests are routed to healthy virtual machines.
10. Configure a load balancing rule for the app tier load balancer to distribute incoming traffic to the virtual machines in the backend pool.
11. Repeat steps 7-10 for the web tier load balancer.
12. Create a SQL Server and a database instance for the data tier.
13. Create a firewall rule to allow inbound traffic to the SQL Server from the app subnet.
14. Update the custom script extension for the app tier virtual machines to include the necessary database client libraries and configuration.
15. Define appropriate monitoring and alerting for the environment.

