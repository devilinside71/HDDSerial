Linux
https://unix.stackexchange.com/questions/121757/harddisk-serial-number-from-terminal
udevadm info --query=all --name=/dev/sda | grep ID_SERIAL

lsblk --nodeps -o name,serial,type,tran,model,vendor

hdparm -I /dev/sd? | grep 'Serial\ Number'
lshw -class disk
smartctl -i /dev/sda

# apt-get install hdparm
# apt-get install smartmontools
# apt-get install lshw

Windows (admin?)
wmic /APPEND:wlist.txt diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv

