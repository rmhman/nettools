import sys
from genie.testbed import load

def save_running_config(testbed_file):
    testbed = load(testbed_file)

    for device_name, device_info in testbed.devices.items():
        device = testbed.devices[device_name]
        device.connect()
        running_config = device.parse('show running-config')
        output_file_path = f'/shared/runconfig/{device_name}.txt'
        with open(output_file_path, 'w') as output_file:
            print(running_config, file=output_file)
        device.disconnect()

# Get the testbed file path from command-line arguments
if len(sys.argv) < 2:
    print("Please provide the testbed file path as a command-line argument.")
    sys.exit(1)

testbed_file = sys.argv[1]
save_running_config(testbed_file)