import sys
import os
from genie.testbed import load

def save_show_output(testbed_file, show_command):
    testbed = load(testbed_file)

    for device_name, device_info in testbed.devices.items():
        device = testbed.devices[device_name]
        device.connect()
        show_output = device.parse(show_command)
        output_directory = f'/shared/{show_command.lower().replace(" ", "_")}_output'
        os.makedirs(output_directory, exist_ok=True)  # Create directory if it doesn't exist
        output_file_path = f'{output_directory}/{device_name}.txt'
        with open(output_file_path, 'w') as output_file:
            print(show_output, file=output_file)
        device.disconnect()

# Check for help flag
if len(sys.argv) > 1 and sys.argv[1] in ['-h', '--help']:
    print("Usage: python getshow.py [testbed_file] [show_command]")
    print("If no testbed file is provided, the default path /shared/testbed.yml will be used.")
    sys.exit(0)

# Get the testbed file path and show command from command-line arguments
if len(sys.argv) < 3:
    print("No testbed file path or show command specified.")
    print("Usage: python getshow.py [testbed_file] [show_command]")
    sys.exit(1)
else:
    testbed_file = sys.argv[1]
    show_command = sys.argv[2]

save_show_output(testbed_file, show_command)