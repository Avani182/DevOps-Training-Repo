# DevOps-Training-Repo

1. main.tf - has resource definition (we can check resource argument in official terraform document) 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#argument-reference

2. outputs.tf - call defined resources  ( we can check attributes in the official terraform document)
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#attribute-reference

3. variables.tf - define variables

4. version.tf - define the terraform version and provider version

5. provider.tf - configure region, profile, etc. properties to allow TF Auth for the AWS Infra.
Provider version of terraform is directly dependent upon resource configuration we used. So, resource configurations such as resource type, attribute and argument references may change depending upon the provider version you select/define in the provider.tf config file.

6. terraform.tfvars - it will define property value which is not defined in variables.tf file

7. lock-hcl - has the provider version (if we don’t provide the version then it will use the latest provider version)

8. backend.tf - If multiple users use the same repo on different computers then every time it will create a new terraform. tfstate file every time, so someone else changes will not update in another employee. So to make a consistent terraform. tfstate file, we have to create a backend.tf file,  which stores terraform.tfstste in the S3 bucket and this S3 bucket will be created manually.



Terraform init will create terraform.lock hcl file and .terraform folder 

terraform.lock.hcl file has the provider version (if we don’t provide the version then it will use the latest provider version)
.terraform folder has a provider file, it will download resource-specific libraries

Terraform fmt - fmt colde

terraform validate - validate code, if there is any error, it will show in the validate

terraform plan - will create terraform.tfstate file and .lock file temporarily, until plan command executes. .tfstate file contains the resources we added and the lock file will lock the tfstate file temporarily. (This is the first time when executed the plan was)

If we already executed the terraform apply command and again execute the terraform plan, it will update the .tfstate file with the changes we made.

terraform apply -auto-approve - will generate/update a .tfstate file and persist .lock file until the apply command executes.

terraform show - will check the terraform.tfstate file and display the number of resources provisioned. (terraform.tfstate file is basically a database file for TF), if we change something then it will show the changes.

terraform destroy -auto-approve - it will destroy all the resources present in the tfstate file.

terraform show - will check the terraform.tfstate file and show the resource (blank, because we destroyed it))

locals.tf
data.tf


Converting non-modular to modular structured TF code:   Create an env/test folder and move all folders in the test. 

Then test again in the env/test folder itself.



Create a Module/S3 folder and copy and paste the main.tf, variables. tf, outputs. tf

In any variables.tf file, don’t give variable default value. All variable values should be provided in Terraform. tfstate file, which is on main main level.

Then module’s files are done.



Now we need to change 2 files at main main level (env/test)

main. tf and outputs. tf


Always open the file from the left sidebar


In main.tf you have to call the module like below,

module "S3_test" {
  source = "../../Modules/S3"
  bucket_name = var.bucket_name
  tag_name = var.tag_name
  env_name = var.env_name
}

Here we have an S3 bucket module call, give any module name then in the source, provide the S3 path.

Then in Module’s variables.tf there is no default value defined. So we have to call variables in main main.tf. So for that provide a variable name from S3’s variables.tf and call it from main main level’s variable.tf

 bucket_name = var.bucket_name
(Modules/S3/variables.tf name) = var. (env/test/variables.tf name)  
tag_name = var.tag_name
env_name = var.env_name




In the main level of the Output.tf file, 

output "s3_bucket_name" {
  value = module.S3_test.s3_bucket_name
}

There is no resource defined at the main-main level, we call the module over there instead. So, in output.tf we can give any output name. but in value, we have to provide:   module.module-name.(Module/S3/Output.tf’s output name)

In modular structure , when you execute a terraform plan then it will show module which we called.
￼


GitHub Repo

Create blank repo in GitHub and clone it via SSH to local.

So you need to authenticate via public and private key to clone via ssh.
Follow below document to authenticate.

https://phoenixnap.com/kb/git-clone-ssh

After creating pub and private key, go to public key location and execute cat (pub key file), it will show the ssh key, which you need to add in Github account level.

Then you will be able to clone the repo. You can create folder in local and clone the repo in that. Then create feature branch and then add project files and folders, which you want add. 
Then do $ git status and $ ls -la to verify, if it is added or not.
Then test the project by executing terraform commands.
Make sure there should be no .tfstate file present(File which generated after applying terraform commands). Only lock.hcl file should be present and add .gitignore file (make sure in that .tfstate file included, so if there is .tfstate file present in the project, it will igonre that file)
Then execute a git commands to push the changes you made in the repo. 

$ git add .
$ git commit -m "Message"
$ git push

Then go to Github and create PR by giving descriptionn and label.

 