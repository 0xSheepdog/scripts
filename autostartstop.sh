#!/bin/bash

IPAVMS=(ipa01 ipa02)
LOGVMS=(llogagg)
SECVMS=(ossec nessus)
WSVMS=(rh7wks01 rh7wks02 rh7wks03 rh7wks04)

VMGROUPS=(WSVMS SECVMS IPAVMS LOGVMS)

for G in $VMGROUPS
do
  for VM in $WSVMS
   do
    echo "Shutting down ${VM}..."
    virsh shutdown $VM
  done
  
  echo "Pausing for a few seconds..."
  sleep 15
done
