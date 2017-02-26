# Automated Service Provisioning Demo

Here I'm building Network Automation Solution for L3VPN service provisioning.


## 1 - Lab Environment
After couple of versions and troubles I ended up to following virtual lab environment:

See network diagram: [Automation-concept.pdf](https://github.com/kaage/NetAutomation_materials/blob/master/Final-solution/Automation-concept.pdf)

* Windows 7 laptop with 16 GB of memory
  * Vagrant Ubuntu VM created according Ivan's instructions on **Virtual-box**
  * **Virtual Lab on GNS3**
    * All virtual Devices on **GNS3 VM** on **VMware Workstation Pro** (because of nested virtualization support)
    * Five **Cisco IOSv** Routers forming MPLS backbone network
    * Two **Cisco IOSv L2** Switches for two MPLS sites
    * Two small **TinyCoreLinux** hosts, one in each site (can be moved from VRF to another)
    * **PaloAlto Networks VM** on third site for interconnecting MPLS L3VPNs and providing access to outside world
    * MPLS backbone and Firewall are initially configured
    * SSH access from Vagrant VM to all devices works
    * Sample L3VPN: vrf A is configured for reference

## 2 - Data Models

My network services defined are:
* MPLS backbone, Switch management and Firewall (Infrastructure Data Model)
* MPLS L3VPN service with optional connection to Firewall (Services Data Models)

Diagram below is a summary of Data Models, Jinja2 templates and Ansible playbooks I have. Exact file names can be found there as well.

### Infrastucture Data Model

In Infrastructure part I decided to go from Source data (data model) to device configurations in a single step. 

### Services Data Models
In Services part I decided to have two step process when going from source data to device configurations. There is additional abstraction level.

### Overview picture of Data Models
![alt text](https://github.com/kaage/NetAutomation_materials/blob/master/Final-solution/overview.png "Overview of Data Models")


## 3 - Pre-deployment validations and deploying configurations

### Validate Infrastructure Configurations

*validate-infra-states.yml* playbook verifies:
* If BGP sessions in MPLS backvone are up

Things you could validate in the future (not yet implemented)
* If LLDP neighbors are up and have correct peers
* If OSPF neighbors are up
* If LDP neighbors are up

### Deploy Initial Network Services

In this step we are going to deploy already created service configurations.

*deploy-service-configs.yml* does the job. It deploys all VRFs into device.

In the future all sorts of validation needs to be implemented to validate if service has been implemented correctly. 


## 4 - Logging and Testing

### Logging

This week I decided to take a copy of Week4 playbooks and modify them. *deploy-infra-configs.yml* and *deploy-service-configs.yml* contains now logging fuctionality to log ios_config outputs. However, It seems in Ansible 2.2 we aren't getting much output, just changed or not information. In Ansible 2.3 development code you should get also information what have changed.

Logging functionality is controlled by defining directory for debug files in variable debug-output like this:
`ansible-playbook deploy-infra-configs.yml --extra-vars "debug_output=debug-outputs"`

Playbook will place debug outputs to files with timestamps so you can see what happened even playbook has been run for multiple times.

### Unit Testing

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

### Automate Unit Testing
*run-data-model-validation.sh* bash script runs broken data-models agains validation playbook and validates also real data-model agains it.


## 5 - Future Development

Here are future steps when developing data models:
* Jinja2 templates are not ready for Firewall
* There is lots of refactoring needed to make data models clear and easy to use
* Develop Jinja2 template for creating L3VPN diagram

In the future some of the more advanced features are also needed:
* Service Removal
* Pre Deployment Verifications
* Automatic cleanup of services
* etc...
