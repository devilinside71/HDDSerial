#!/bin/bash
sudo dmidecode -t system  | grep "System Information" -A10 | grep "Manufacturer\|Product Name\|Serial Number\|SKU Number" >> l_pc_list.txt
sudo lshw | grep "-network" -A10 | grep "description\|product\|vendor\|serial" >> l_pc_list.txt
sudo lsblk --nodep -o name,serial,type,tran,model,vendor,rota | grep -v -e "rom\|usb\|loop\|ROTA" >> l_pc_list.txt
echo ---------------- >> l_pc_list.txt

