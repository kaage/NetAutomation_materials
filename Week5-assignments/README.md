# Week 5 - Hands-on assignments

Logging and Testing - goal is to validate all sorts of things before commit changes to the devices. Also we will enable logging of playbook actions to be able to figure out what happened.

## Task 1 - Logging

This week I decided to take a copy of Week4 playbooks and modify them. *deploy-infra-configs.yml* and *deploy-service-configs.yml* contains now logging fuctionality to log ios_config outputs. However, It seems in Ansible 2.2 we aren't getting much output, just changed or not information. In Ansible 2.3 development code you should get also information what have changed.

Logging functionality is controlled by defining directory for debug files in variable debug-output like this:
`ansible-playbook deploy-infra-configs.yml --extra-vars "debug_output=debug-outputs"`

Playbook will place debug outputs to files with timestamps so you can see what happened even playbook has been run for multiple times.

## Task 2 - Unit Testing
