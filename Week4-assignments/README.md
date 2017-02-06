# Week 4 - Hands-on assignments

Deploy Network Services from Data Models - goal is to deploy network service configurations created from data models. 

At this point I have implemented only IOS-router configs. Configurations for Switches and Firewall hasn't been implemented yet. This is something I will address in the future.

## Task 1 - Create Initial Device Configurations

Initial Device Configurations has already been created on Week3-assignments playbooks. I'm just utilizing them this week.

## Task 2 - Validate Infrastructure Configurations

*validate-infra-states.yml* playbook verifies:
* If BGP sessions in MPLS backvone are up

Things you could validate in the future (not yet implemented)
* If LLDP neighbors are up and have correct peers
* If OSPF neighbors are up
* If LDP neighbors are up

## Task 3 - Deploy Initial Network Services

In this step we are going to deploy already created service configurations.

*deploy-service-configs.yml* does the job. It deploys all VRFs into device.

In the future all sorts of validation needs to be implemented to validate if service has been implemented correctly. 

## Task 4 - Incremental Services Deployment

In the future some of the more advanced features are also needed:
* Service Removal
* Pre Deployment Verifications
* Automatic cleanup of services
* etc...