wmic diskdrive get Name, Manufacturer, Model, InterfaceType, MediaType, SerialNumber /format:csv | find "PHYSICAL" >> whddlist.txt
wmic nicconfig get Description, MACAddress /format:csv | find ":" >> wniclist.txt
wmic bios get Name, Manufacturer, SerialNumber /format:csv | find "Ver" >> wbioslist.txt
wmic OS LIST BRIEF /format:csv  | find "WINDOWS" >> woslist.txt