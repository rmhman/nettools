# pyATS

## Create your testbed (inventory file) 

Start with Excel and these column names:
* hostname
* os
* ip
* protocol
* username
* password
* enable_password
* type
* model

It is best to keep them in this order.</br>
Then to create your testbed, you can issue this command:</br>
```pyats create testbed file --path inventory.xlsx --output testbed.yml```

## getrun.py

`getrun.py` will take the hosts in your testbed file, save the running config of every device, and output it to the `/shared/runconfig/` directory </br>
**Usage:** python script.py [testbed_file]</br>
**Note:** If you do not input the file location of your `testbed.yml` file, it will default to `/shared/testbed.yml`