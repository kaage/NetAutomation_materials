# Week 3 - Hands-on assignments

Data Models - goal is to define infrastucture and service data-models and document them.


## Overall picture of data models

### List of Data Models

My network services defined are:
* MPLS backbone, Switch management and Firewall (Infrastructure Data Model)
* MPLS L3VPN service with optional connection to Firewall (Services Data Models)

Diagram below is a summary of Data Models, Jinja2 templates and Ansible playbooks I have. Exact file names can be found there as well.

### Infrastucture Data Model

In Infrastructure part I decided to go from Source data (data model) to device configurations in a single step. 

### Services Data Models
I decided to have two step process when going from source data to device configurations. There is additional abstraction level.

![alt text](https://github.com/kaage/NetAutomation_materials/blob/master/Week3-assignments/overview.png "Overview of Data Models")