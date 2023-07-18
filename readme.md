# **Creating AWS window Ami using packer**

#### **Introduction**

-   Packer is part of the HashiCorp open-source suite of tools
-   It's an open-source command-line tool that allows us to create custom VM images of any OS.

##### **The structure of the Packer template**

```plaintext
{
	"variables": {
		// list of variables defined, like-
		"instance_size": "t2.medium",
		...
	},
	"builders": [	
		{
		//builders properties is like-
			"ami_name": "WIN2019-BASE-{{timestamp}}",
			...
		}
	],
	"provisioners": [
		{
			// list of scripts to execute for image provisionning
			{
    		  "type": "powershell",		 
    		  "scripts": ["./scripts/basic_softwares.ps1"] 
	    	}
		}
	]
}
```

##### **Pre-Requisite**

-   Should have knowledge of how to write packer script using JSON
-   Should have knowledge of how to write provisioners script using PowerShell
-   Should have knowledge of how to write Jenkins pipeline

### **Installation**

##### **Checkout Repository**

-   Check out the project code from git.

```plaintext
$git clone https://github.com/jbharti/packer-window-ami.git
```

##### **How to write a packer script?**

-   Write your own scripts with the help of a sample script provided in the repository.
-   The provisioner scripts must be kept inside the script folder.
-   Variable must go inside var.json
-   Commit your code in a git repo.

##### **How to Uses**

-   Create a Jenkins pipeline (Ex. CreateAMI) using Jenkinsfile given in the Jenkins folder.
-   In the above pipeline, create two Parameter SCRIPT & VARIABLE
-   In SCRIPT pass your script name Ex. base\_window\_ami
-   In VARIABLE pass your variable file name Ex. var
-   Then trigger the build.

##### **How it Works**

-   When the build trigger, it creates the container using image ami-using-packer:0.1
-   This container work as the node for the Jenkins pipeline
-   Inside the container, packer v1.7.0 is installed.
-   It runs the script with the given variable file.
-   on the successful run, an image will be created
