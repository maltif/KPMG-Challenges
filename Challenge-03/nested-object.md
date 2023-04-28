Here is the python function that can handle this task:

```python
Copy code
def get_value(obj, key):
    # Split the key into parts based on the '/'
    key_parts = key.split('/')
    
    # Iterate over the key parts and traverse the object
    # to get the nested value
    value = obj
    for part in key_parts:
        value = value.get(part)
        if value is None:
            break
    
    return value
```
This function takes in two arguments: the obj (the nested object) and the key (the string representing the nested key). It splits the key string into parts using the / character as a delimiter. It then iterates over each key part, traversing the obj dictionary to retrieve the nested value. If at any point a key part does not exist in the dictionary, the function stops traversing and returns None.

Here's an example usage of the function:

```python
obj1 = {"a":{"b":{"c":"d"}}}
key1 = "a/b/c"
value1 = get_value(obj1, key1)
print(value1)  # Output: d

obj2 = {"x":{"y":{"z":"a"}}}
key2 = "x/y/z"
value2 = get_value(obj2, key2)
print(value2)  # Output: a
```
