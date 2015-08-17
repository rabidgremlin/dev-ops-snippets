Example scripts for building a full AWS stack

These scripts build a multi-AZ set of servers including a VPC, load balancer and RDS database and deploy a simple PHP example application. Can be used as a base for automating your own deployments.

Basic usage
1. Create a environment specific .yml file e.g. example_vars.yml (you can create as many environments as you want/need)
2. Build the AWS infrastructure using build playbook, passing in name of environment:

    ansible-playbook -i inventory/ec2.py build.yml -e "env=example"

3. Deploy the app to the infrastructure using deploy playbook:

    ansible-playbook -i inventory/ec2.py deploy.yml -e "env=example" --private-key keys/example_key.pem

Initial set up
TBD

TODOs
TBD

    
