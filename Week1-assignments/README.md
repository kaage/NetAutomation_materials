# Week 1 - Hands-on assignments
Task was to build my own lab for the course and create a Github account.

## Task 1 - Creating Github account
Github account has been created as you can see :)

## Task 2 - Building your lab
After couple of versions and troubles I ended up to following virtual lab environment:

See network diagram: [Automation-concept.pdf](https://github.com/kaage/NetAutomation_materials/blob/master/Week1-assignments/Automation-concept.pdf)

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
