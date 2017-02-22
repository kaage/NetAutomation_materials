def lowercase_all(arg): 
    return arg.lower() 


class FilterModule(object): 
    def filters(self): 
        return {'lowercase_all': lowercase_all} 