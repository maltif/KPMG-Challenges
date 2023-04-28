# Creating a 3-tier Environment on Azure using Terraform
This guide explains how to use Terraform to create a 3-tier environment on Azure. The environment includes an application tier, a web tier, and a data tier, each with their own virtual machines and load balancers. The steps outlined here are high-level and may need to be customized based on your specific requirements.

## Prerequisites

Before you start, you need to have the following:

* An Azure account
* The Azure CLI installed
* Terraform installed

1. Define the Azure provider and authenticate Terraform with your Azure account.
    * Please refer to [01-provider.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/01-provider.tf) for terraform code.
2. Create a resource group for environment.
    * Please refer to [02-resource-group.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/02-resource-group.tf) for terraform code.
3. Create a virtual network with app, web, and data.
    * Please refer to [03-virtual-network.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/03-virtual-network.tf) for terraform code.    
4. Create three subnets as app, web, and data.
    * Please refer to [04-subnet.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/04-subnet.tf) for terraform code.    
5. Create network security groups for each subnet to control inbound and outbound traffic.
    * Please refer to [05-security-group.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/05-security-group.tf) for terraform code.    
6. Provision virtual machines for each tier using a custom script extension to install required software and configure the machine.
    * Please refer to [06-virtual-machine.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/06-virtual-machine.tf) for terraform code.    
7. Configure load balancers for the app and web tiers to distribute traffic and increase availability.
    * Create a backend pool for the app tier load balancer, and associate it with the virtual machines created in step 5.
    * Create a frontend IP configuration and associate it with the app tier load balancer.
    * Create a health probe for the app tier load balancer to ensure that requests are routed to healthy virtual machines.
    * Configure a load balancing rule for the app tier load balancer to distribute incoming traffic to the virtual machines in the backend pool.
    * Please refer to [07-load-balancer.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/07-load-balancer.tf) for terraform code.    

8. Repeat steps 7-10 for the web tier load balancer.
9. Create a SQL Server and a database instance for the data tier.
    * Please refer to [08-database.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/08-database.tf) for terraform code.
10. Create a firewall rule to allow inbound traffic to the SQL Server from the app subnet.
    * Please refer to [09-sql-server-firewall-rule.tf](https://github.com/maltif/KPMG-Challenges/blob/main/terraform/09-sql-server-firewall-rule.tf) for terraform code.
