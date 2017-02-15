from jinja2 import TemplateError
class FilterModule(object):
def list_append(self,l,*argv):
if type(l) is not list:
raise TemplateError("First argument must be a list")
for element in argv:
if type(element) is list:
l.extend(element)
else:
l.append(element)
return l
def filters(self):
return { 'append': self.list_append }
