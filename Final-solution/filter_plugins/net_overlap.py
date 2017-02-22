def net_overlap(arg):
    import ipaddr
    for index,item in enumerate(arg):
    	for index2,item2 in enumerate(arg):
	    	if index != index2:	
	    		net1 = ipaddr.IPNetwork(item)
	    		net2 = ipaddr.IPNetwork(item2)
	    		if net1.overlaps(net2):
	    		    return True
    return False

class FilterModule(object): 
    def filters(self): 
        return {'net_overlap': net_overlap} 