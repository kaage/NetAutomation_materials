# Week 5 - Hands-on assignments

Logging and Testing - goal is to validate all sorts of things before commit changes to the devices. Also we will enable logging of playbook actions to be able to figure out what happened.

## Task 1 - Logging

This week I decided to take a copy of Week4 playbooks and modify them. *deploy-infra-configs.yml* and *deploy-service-configs.yml* contains now logging fuctionality to log ios_config outputs. However, It seems in Ansible 2.2 we aren't getting much output, just changed or not information. In Ansible 2.3 development code you should get also information what have changed.

Logging functionality is controlled by defining directory for debug files in variable debug-output like this:
`ansible-playbook deploy-infra-configs.yml --extra-vars "debug_output=debug-outputs"`

Playbook will place debug outputs to files with timestamps so you can see what happened even playbook has been run for multiple times.

## Task 2 - Unit Testing

In this task I'm going to validate input data for *High Level L3VPN Service Data Model*.

Test scenarios:
* 1 Data Model has correct YAML-syntax
* 2 Data Model has dictionary of *l3vpns* defined
* 3 Data Model has one or more l3vpns in the list
* 4 Each l3vpn has either TRUE or FALSE value in the *connection_to_firewall* field
* 5 Each l3vpn has *unique* real *number* in the *id* field
* 6 Each l3vpn has *unique* real *ipv4 prefix* in *the* prefix field
* 7 Each l3vpn has list of *sites* and the list is containing one or more site names
* 8 Data Model has nothing more defined

Broken data model for each scenario is below:
* 1 broken_service-datamodel-l3vpn-hl-1.yml
* 2 broken_service-datamodel-l3vpn-hl-2.yml
* 3 broken_service-datamodel-l3vpn-hl-3.yml
* 4 broken_service-datamodel-l3vpn-hl-4.yml
* 5 broken_service-datamodel-l3vpn-hl-5.yml
* 6 broken_service-datamodel-l3vpn-hl-6.yml
* 7 broken_service-datamodel-l3vpn-hl-7.yml
* 8 broken_service-datamodel-l3vpn-hl-8.yml

*validate-service-yaml-syntax.yml* runs yamllint (syntax checking) against each 8 test Data Models above. Just first one of them has incorrect YAML-syntax and should fail.