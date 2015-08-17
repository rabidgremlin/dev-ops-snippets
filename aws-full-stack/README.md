Example Ansible scripts for building a full AWS stack
=============================================
These scripts build a multi-AZ set of servers including a VPC, load balancer and RDS database and deploy a simple PHP example application. Can be used as a base for automating your own deployments.

Basic usage
===========
1. Do initial set up (see below)
2. Create a environment specific .yml file e.g. example_vars.yml (you can create as many environments as you want/need, see below for more detail)
3. Build the AWS infrastructure using build playbook, passing in name of environment:

  ```
  ansible-playbook -i inventory/ec2.py build.yml -e "env=example"
  ```
4. Deploy the app to the infrastructure using deploy playbook:

  ```
  ansible-playbook -i inventory/ec2.py deploy.yml -e "env=example" --private-key keys/example_key.pem
  ```

Initial set up
==============
1. Download source to a folder
2. Run setup script to ensure all required libraries installed:

```
./setup.sh
```
3. Create IAM user using AWS console. Give them "Power User" role and download AWS access key and access secret.
4. Create env.sh containing access key, access secret and your region:

```
    export AWS_ACCESS_KEY_ID=Axxxxxxxxxxxxxxxxxxxxxxxxxx
    export AWS_SECRET_ACCESS_KEY=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    export AWS_REGION=ap-southeast-2
```    
5. Run env.sh to set environment variables (NOTE: YOU WILL NEED TO DO THIS ONCE EVERY SESSION):

```
    source env.sh
```    
6. Test connectivity + set up (thsi can take a moment and should return some JSON if everything worked)

```
    python inventory/ec2.py
```

TODOs
=====
TBD
