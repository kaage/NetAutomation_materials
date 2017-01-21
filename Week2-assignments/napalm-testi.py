from netmiko import ConnectHandler
from napalm import get_network_driver
get_network_driver('ios')
driver = get_network_driver('ios')
device = driver('10.255.100.10', 'cisco', 'cisco')
device.open()
device.get_mac_address_table