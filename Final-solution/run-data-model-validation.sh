#!/bin/bash
#
# Run data-model validation unit tests
#
echo "Running data model validation unit tests"
if [ ! -f hosts ]; then
  echo ".. Cannot find Ansible inventory file hosts in current directory, aborting"
  echo 
  echo "Hint: run this script from main project directory."
  echo "Typical command would be tests/run-predeploy-tests.sh"
  exit
fi

echo "Running initial test (should succeed)"
ansible-playbook validate-service-data-model.yml -e svcs=service-datamodel-l3vpn-hl-correct.yml >/dev/null 2>/dev/null

if [ $? -ne 0 ]; then
  echo ".. initial test failed, cannot proceed"
  exit 1
fi
echo "  .. OK, proceeding"

exitstatus=0
for svctest in broken-data-models/broken_service-datamodel-l3vpn-hl-*.yml
do
  echo "Running scenario $svctest"
  ansible-playbook validate-service-data-model.yml -e svcs=$svctest >/dev/null 2>/dev/null
  if [ $? -ne 0 ]; then
    echo "  .. failed as expected"
  else
    echo "  >>> DID NOT FAIL"
    exitstatus=1
  fi
done 

if [ $exitstatus -ne 0 ]; then echo "Test suite failed"; fi
exit $exitstatus