import pandas as pd
import yaml

def convert_xlsx_to_inventory():
    # Prompt user for input file path
    xlsx_file = input("Enter the path of the input Excel file: ")

    # Prompt user for output file path
    output_file = input("Enter the path of the output YAML file: ")

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
        for col in df.columns[2:]:
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

    # Write inventory YAML to output file
    with open(output_file, 'w') as f:
        f.write(inventory_yaml)

# Usage
convert_xlsx_to_inventory()