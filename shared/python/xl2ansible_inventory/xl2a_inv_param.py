import pandas as pd
import yaml
import sys

def convert_xlsx_to_inventory(xlsx_file, output_file):
    # Load the Excel spreadsheet
    df = pd.read_excel(xlsx_file)

    # Create the inventory dictionary
    inventory = {
        "all": {
            "children": {},
            "hosts": {}
        }
    }

    # Iterate over the rows of the spreadsheet
    for index, row in df.iterrows():
        host = str(row.iloc[0])
        group = str(row.iloc[1])
        variables = {}

        # Iterate over the columns and extract variables
        for col in df.columns[1:]:
            key = str(col)
            value = str(row[col])
            variables[key] = value

        # Add host and variables to the inventory
        inventory["all"]["hosts"][host] = variables

        # Add host to the respective group
        if group not in inventory["all"]["children"]:
            inventory["all"]["children"][group] = {
                "hosts": {}
            }
        inventory["all"]["children"][group]["hosts"][host] = None

    # Convert inventory dictionary to YAML
    inventory_yaml = yaml.dump(inventory)

    # Remove null values from the YAML output
    inventory_yaml = inventory_yaml.replace(' null', '')
    inventory_yaml = inventory_yaml.replace("'%ENV{PYATS_ENABLE_PASS}'", '"{{ lookup(\'env\', \'PYATS_ENABLE_PASS\') }}"')
    inventory_yaml = inventory_yaml.replace("'%ENV{PYATS_PASS}'", '"{{ lookup(\'env\', \'PYATS_PASS\') }}"')
    inventory_yaml = inventory_yaml.replace("'%ENV{PYATS_USER}'", '"{{ lookup(\'env\', \'PYATS_USER\') }}"')

    # Write inventory YAML to output file
    with open(output_file, 'w') as f:
        f.write(inventory_yaml)

# Usage
if len(sys.argv) != 3:
    print("Usage: python xl2a_inv_param.py <input_file> <output_file>")
else:
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    convert_xlsx_to_inventory(input_file, output_file)