wmic /APPEND:wlist.txt diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv
