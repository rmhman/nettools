import sys
import os
from genie.testbed import load

def save_running_config(testbed_file):
    testbed = load(testbed_file)

    for device_name, device_info in testbed.devices.items():
        device = testbed.devices[device_name]
        device.connect()
        running_config = device.parse('show running-config')
        output_directory = '/shared/runconfig'
        os.makedirs(output_directory, exist_ok=True)  # Create directory if it doesn't exist
        output_file_path = f'{output_directory}/{device_name}.txt'
        with open(output_file_path, 'w') as output_file:
            print(running_config, file=output_file)
        device.disconnect()

# Check for help flag
if len(sys.argv) > 1 and sys.argv[1] in ['-h', '--help']:
    print("Usage: python getrun.py [testbed_file]")
    print("If no testbed file is provided, the default path /shared/testbed.yml will be used.")
    sys.exit(0)

# Get the testbed file path from command-line arguments
if len(sys.argv) < 2:
    print("No testbed file path specified. Using the default path: /shared/testbed.yml")
    testbed_file = '/shared/testbed.yml'
else:
    testbed_file = sys.argv[1]

save_running_config(testbed_file)