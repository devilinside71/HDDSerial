Linux
https://www.pendrivelinux.com/live-cd-repository/
https://unix.stackexchange.com/questions/121757/harddisk-serial-number-from-terminal
udevadm info --query=all --name=/dev/sda | grep ID_SERIAL

lsblk --nodeps -o name,serial,type,tran,model,vendor

hdparm -I /dev/sd? | grep 'Serial\ Number'
lshw -class disk
smartctl -i /dev/sda

# apt-get install hdparm
# apt-get install smartmontools
# apt-get install lshw




https://www.cyberciti.biz/faq/how-to-find-serial-number-of-lenovo-laptop-from-linux/
sudo dmidecode -s string

sudo dmidecode -s processor-family





Windows (admin?)
wmic /APPEND:wlist.txt diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv
wmic nicconfig get Description, MACAddress, IPAddress, IPSubnet, DefaultIPGateway, DNSServerSearchOrder, DHCPEnabled
wmic /APPEND:wniclist.txt nicconfig get Description, MACAddress  /format:csv | find ":"
wmic nicconfig get Description, MACAddress /format:csv | find ":" >> wniclist.txt
wmic diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv >> whddlist.txt
wmic diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv | find "PHYSICAL" >> whddlist.txt
wmic /APPEND:e:wlist.csv bios get Name, Manufacturer, SerialNumber
wmic bios get Name, Manufacturer, SerialNumber >> wbioslist.txt
wmic bios get Name, Manufacturer, SerialNumber /format:csv  | find "Ver" >> wbioslist.txt
wmic OS LIST BRIEF /format:csv  | find "WINDOWS" >> woslist.txt

wmic os get Name, Manufacturer, Version, BuildNumber, OSType, SerialNumber /format:csv  | find "WINDOWS" >> woslist.txt

wmic baseboard get Manufacturer, Model, Product, SerialNumber, Version

MAC address, OP, alaplap(gép)
dir /B | findstr /R /C:"[mp]"



MacOS
HDD info:
system_profiler SPSerialATADataType

MAC address:
ifconfig | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
