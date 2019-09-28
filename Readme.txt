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

MAC address, OP, alaplap(gép)



MacOS
HDD info:
system_profiler SPSerialATADataType

MAC address:
ifconfig | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'
