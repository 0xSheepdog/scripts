#!/bin/bash
#!/bin/bash
## Poor Mans CDP analyzer
## v 0.0.1
## originally conceived and written by M### B#######
## updated by Jeff Pettorino
##
WSVMS="rh7wks01 rh7wks02 rh7wks03 rh7wks04"
SECVMS="ossec nessus"
IPAVMS="ipa01 ipa02"
LOGVMS="llogagg"
VMGROUPS="WSVMS SECVMS IPAVMS LOGVMS"

for G in VMGROUPS
do
  for VM in WSVMS
   do
    echo "Shutting down ${VM}..."
    virsh shutdown $VM
  done
  
  echo "Pausing for a few seconds..."
  sleep 15
done
