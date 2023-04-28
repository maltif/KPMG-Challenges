                                                                    Challenge #1 
Problem Definition: A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these resources on a cloud environment (Azure/AWS/GCP).
ANS- creating a 3-tier environment on Azure using Azure Resource Manager (ARM) templates.
we will need an Azure subscription, Azure CLI installed on our machine, and a text editor to create the ARM template.
Step 1: Create an Azure Resource Group
An Azure Resource Group is a logical container for our resources. 
It's a best practice to create a separate resource group for each environment (dev, test, prod) to help with management and security.

we can create a new resource group using the following Azure CLI command:

#az group create --name myResourceGroup --location eastus
This command creates a resource group named "myResourceGroup" in the "East US" region.

Step 2: Create an Azure Virtual Network
An Azure Virtual Network is a logically isolated network that you can use to host your resources. 
we can create a new virtual network using the below Azure CLI command:
#az network vnet create --resource-group myResourceGroup --name myVnet --address-prefixes 10.0.0.0/16

This command creates a virtual network named "myVnet" with an address space of 10.0.0.0/16.

Step 3: Create Subnets
Subnets are subdivisions of a virtual network that you can use to group resources together. 
In a 3-tier environment, you have a subnet for each tier.
You can create subnets using the following Azure CLI commands:

#az network vnet subnet create --resource-group myResourceGroup --vnet-name myVnet --name webSubnet --address-prefixes 10.0.1.0/24

#az network vnet subnet create --resource-group myResourceGroup --vnet-name myVnet --name appSubnet --address-prefixes 10.0.2.0/24

#az network vnet subnet create --resource-group myResourceGroup --vnet-name myVnet --name dbSubnet --address-prefixes 10.0.3.0/24

These commands create three subnets named "webSubnet", "appSubnet", and "dbSubnet" with address spaces of 10.0.1.0/24, 10.0.2.0/24, and 10.0.3.0/24 respectively.

Step 4: Create Network Security Groups

Network Security Groups (NSGs) are used to control network traffic to and from subnets. 
In a 3-tier environment, you typically have an NSG for each subnet.
You can create NSGs using the following Azure CLI commands:

#az network nsg create --resource-group myResourceGroup --name webNSG

#az network nsg create --resource-group myResourceGroup --name appNSG

#az network nsg create --resource-group myResourceGroup --name dbNSG

These commands create three NSGs named "webNSG", "appNSG", and "dbNSG".

Step 5: Create NSG Rules
After creating the NSGs, you need to add rules to control network traffic.
 In a 3-tier environment, you typically have the following rules:
Web tier: Allow inbound HTTP and HTTPS traffic (ports 80 and 443).
App tier: Allow inbound traffic from web tier and outbound traffic to db tier.
DB tier: Allow inbound traffic from app tier.
You can create NSG rules using the following Azure CLI commands:
For webNSG:
#az network nsg rule create --resource-group myResourceGroup




                                                                              Challenge #2

Problem Definition: We need to write code that will query the meta data of an instance within AWS or Azure or GCP and provide a json formatted output.
 Writing some Python code that we can use to query the metadata of an AWS EC2 instance in AWS and format the output as JSON:

# Define the URL of the metadata service
metadata_url = "http://169.254.169.254/latest/meta-data/"

# Define the metadata categories you want to retrieve
metadata_categories = ["instance-id", "ami-id", "instance-type", "public-ipv4", "security-groups"]

# Query the metadata service for each category and store the values in a dictionary
metadata = {}
for category in metadata_categories:
    category_url = metadata_url + category
    response = requests.get(category_url)
    metadata[category] = response.text

# Format the metadata as JSON and print it
json_output = json.dumps(metadata, indent=4)
print(json_output)

                                                                                 






                                                                                    Challenge #3
 Problem Definition: We have a nested object. We would like a function where you pass in the object and a key and get back the value. 
Example Inputs 
object = {“a”:{“b”:{“c”:”d”}}}
 key = a/b/c 
object = {“x”:{“y”:{“z”:”a”}}} 
key = x/y/z 
value = a



Solution: Below example implementation using Python:
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
def get_value_from_nested_object(obj, key):
    keys = key.split('/')
    value = obj
    for k in keys:
        value = value[k]
    return value
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
You can then call this function with your example inputs like this:
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
obj1 = {"a":{"b":{"c":"d"}}}
key1 = 'a/b/c'
value1 = get_value_from_nested_object(obj1, key1) # value1 = "d"
obj2 = {"x":{"y":{"z":"a"}}}
key2 = 'x/y/z'
value2 = get_value_from_nested_object(obj2, key2) # value2 = "a"
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Each key in the path exists in the object. If a key is not found, the function will raise a KeyError exception.

