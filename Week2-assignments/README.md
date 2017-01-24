# Week 2 - Hands-on assignments

Easy wins - Target is to create very simple reporting tool

## What is the problem to solve?

Have you ever replaced a broken switch with new one in a rack full of cables and the switch somewhere in the middle? Been there, seen that but still can't help you in the dirty work. However, my goal is to help you a bit still. 

What if you can have a reporting tool with following features:
* Collects Switchport status information (Up or Down) before and after replacement and shows the difference?
* Collects MAC-address table of the switch before and after replacement and shows the difference?

With this utility you will very quickly see:
* if all cables are plugged in as they were before changes
* if all cables are plugged in to the switchport they were before changes

## How to get MAC-address tables out from the devices?

I think the easiest way to get MAC-address tables in Ansible is using NAPALM. However I discovered a bug in NAPALM but it is fixed in the development branch of NAPALM: [https://github.com/napalm-automation/napalm-ios/issues/104](https://github.com/napalm-automation/napalm-ios/issues/104)

napalm-mac-table-yaml.yml does the job.

## How to get interface information out from the devices?

There are multiple ways to get interface information. I decided to use NAPALM with "interfaces" filter as I was using NAPALM ansible module already

napalm-interfaces-yaml.yml does the job.

## How to combine MAC-table and interface information together?

MAC-address tables and Interface informations are combined into single file using Jinja2 template (interface-mac-report.j2)

Example of Report format:

`Int:	Admin:	Oper:	MAC-addresses:`
----------------------------------------------------------------------------
Gi0/0	True		True  00ed.a0e3.9000 00ed.a0e3.9000
Gi0/1	True		True  0000.0c07.ac01 00ed.a0a7.ec00 0000.0c07.ac0a
Gi0/2	True		True 
Gi0/3	True		True 
Gi1/0	True		True 
Gi1/1	True		True 
Gi1/2	True		True 
Gi1/3	True		True 
Gi2/0	True		True  00ed.a052.0d00
Gi2/1	True		True 
Gi2/2	True		True 
Gi2/3	True		True 
Gi3/0	True		True 
Gi3/1	True		True 
Gi3/2	True		True 
Gi3/3	True		True 
`Vlan1	True		True`
