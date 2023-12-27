# Create a Testbed file from an Ansible inventory

Create testbed files from Ansible Inventories. With Ansible Inventory files this playbook will pull all the required data from these files and populate the data into a pyATS Testbed file.

## Use Case Description

The purpose of this playbook is to eliminate the need for manually creating a Testbed when using pre-existing Ansible Inventory files. It achieves this by utilizing an Ansible inventory group, converting it into a list, and then iterating over the list to generate a testbed file using a Jinja2 template. This approach saves time and avoids duplication by automating the process of setting up the testbed based on the existing inventory files.

## Installation

To install, simply clone this repository. No code dependancies are required, only a standard installation of Ansible and pyATS/Genie.

## Usage

To run the code use the following command

```bash
ansible-playbook -i <yourInventoryFile> testbed_create.yml
```
### Example:
```bash
ansible-playbook -i ../../inventory.yml testbed_create.yml
```
