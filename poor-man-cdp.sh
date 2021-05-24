#!/bin/bash
## Poor Mans CDP analyzer
## v 0.2
## originally conceived and written by Mark Buchanan
## updated by Jeff Pettorino
##
POLLIFACES="eth0"
TMPCDP="/tmp/cdp.out"
DEBUG=false

# Check to ensure tcpdump is installed
if ! command -v tcpdump &> /dev/null
then
    echo "Command tcpdump not found. Please install tcpdump and dependencies."
	exit 65
fi

for IFACE in POLLIFACES
do
  OUTPUT=`tcpdump -i $IFACE -v -s0 -c 1 '(ether[12:2]=0x88cc or ether[20:2]=0x2000)' > $TMPCDP 2>> /dev/null'
  DEVICE=`cat $TMPCDP | egrep "Device-ID \(0x01\)" | egrep -Eo "'([^']+)'"`
  PLATFORM=`cat $TMPCDP | egrep "Platform \(0x06\)" | egrep -Eo "'([^']+)'"`
  MGMTADDR=`cat $TMPCDP | egrep "Address \(0x02\)" | egrep -Eo "'([^']+)'"`
  PORTID=`cat $TMPCDP | egrep "Port-ID \(0x03\)" | egrep -Eo "'([^']+)'"`

  [ ${DEBUG} == "true" ] && for D in DEVICE PLATFORM MGMTADDR PORTID
  do
  echo "-------------------------------------"
  echo "${D} == ${!D}"
  echo "-------------------------------------"
  done
done

rm -f $TMPCDP
