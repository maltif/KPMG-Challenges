```bash
curl -H Metadata:true "http://169.254.169.254/metadata/instance?api-version=2021-02-01" | jq '{vm_name: .compute.name, resource_group: .compute.resourceGroupName, location: .compute.location, tags: .compute.tags}'
```

## Explaination

`jq` is a command-line tool for parsing and manipulating JSON data. It allows you to extract specific fields from JSON objects, transform data, and format output.

In this example, the `jq` command is used to extract the name, resourceGroupName, location, and tags fields from the JSON output returned by the metadata service. The output is then formatted as a new JSON object with key-value pairs for each extracted field.

You can modify this command to extract other fields or add more fields to the output JSON object as needed.

