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
  Note you may need to wait 1 min for the inventory cache to clear or you can run ```python inventory/ec2.py --refresh-cache``` first
5. Use the AWS console to get the DNS name of the load balancer and open it your browser


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

Environment .yml file
=====================
The environment .yml file (xxxx_vars.yml) holds the specific varibles for the environment you want to build:

```
---
control_ip: 175.45.102.163/32

region: ap-southeast-2
zone_1: ap-southeast-2a
zone_2: ap-southeast-2b


server:
  instance_type: t2.micro
  zone_1_count: 1
  zone_2_count: 1


db:
  instance_type: db.t2.micro
  size: 5
  name: rockbands
  user: rockbands
  password: password123
```

* control-ip - The IP address(es) that are allowed to SSH to the servers. You must set this to suit where you are running ansible from
* region - The region you wish to deploy to
* zone_1 - The first availability zone to deploy to
* zone_2 - The second availability zone to deploy to
* server.instance_type - The size of the servers to deploy
* zone_1_count - The number of servers to deploy to zone 1. If you edit this number and rerun build.yml, ansible will increase or decrease the number of servers in this zone. Can be set to 0.
* zone_2_count - The number of servers to deploy to zone 2. If you edit this number and rerun build.yml, ansible will increase or decrease the number of servers in this zone. Can be set to 0.
* db.instance_type - The size of the DB server to deploy
* db.size - The size of the database (5GB minimum)
* db.name - The name of the database
* db.user - The user for the database
* db.password - The password for the database


TODOs
=====
* Improve the handlers in deploy playbook so things are not restarted AFTER instance is added back into load balancer
* Figure out how to give each server a unique sequence number in it's name
* Add tags to ELB (not supported by Ansible yet)
