What does this project do?
Ans- It uses to create window ami according to your requirement. from Custom AWS windows Ami.
How Packers create ami?
Ans-
1. it creates the machine from base ami.
2. It installs your required package on base machine created in the above steps
3. It creates ami from the above machine
4. terminate the machine.

Install packer
https://www.packer.io/docs/install

Set variables

1. set "source_ami": "#PUT AWS BASE WINDOW AMI#", in base_window_ami.json
2. set var.json values

How to run?


time packer build -var-file=var.json base_window_database_ami.json"         

