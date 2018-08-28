---
layout: default
title: MikroTik OmniTik 5ac
category: Hardware
---

The Omnitik 5ac is an outdoor switch/router with a built-in 5Ghz 802.11ac access point and omnidirectional antenna.

_Please be sure to see [MikroTik Specifics](/hardware/mikrotikspecifics) for extra info about Mikrotik devices, how to connect, etc._


## Uses

*   Hub node routing or AP ( for standard 802.11ac hubs )
*   Rooftop installations for multi-tenant houses
*   Providing public access via the omnidirectional antenna

## Configurations

### Omnitik config v3.2
As discussed in the [MikroTik Specifics](/hardware/mikrotikspecifics) page, these devices need a script to be generated and loaded onto the device rather than a saved config file.  
The below is a template script which needs some variables filled in.  
This script _only_ works on the OmniTik 5ac PoE model  

<details>
<summary>Expand for `nycmesh-omnitik-v3.2.rsc` example</summary>
Version 3.2 Changelog:

*   Separation of Public vs Tenant subnet  
*   Fixed BGP sync missed config parameter  
*   Startup delay ( ref Mikrotik forums )  
*   Tada sound effect  
*   Better firewall rules

```
:global nodenumber 1111
:global bgpasn 61111
:global ipprefix "10.70.111"
:global iptenantsrange 10.70.111.5-10.70.111.119
:global iptenantsgw 10.70.111.1
:global ippublicrange 10.70.111.130-10.70.111.180
:global ippublicgw 10.70.111.129
:global dns 10.10.10.10,1.1.1.1

/delay 15


:foreach x in=[/interface wireless find] do={ /interface wireless reset-configuration $x }

/ip address add address=192.168.88.1/24 interface=ether3 network=192.168.88.0


/interface ethernet
set [ find default-name=ether5 ] poe-out=forced-on

/interface wireless security-profiles
add authentication-types=wpa-psk,wpa2-psk management-protection=allowed mode=\
    dynamic-keys name=nycmeshnet supplicant-identity=nycmesh \
    wpa-pre-shared-key=nycmeshnet wpa2-pre-shared-key=nycmeshnet

/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40/80mhz-Ceee disabled=no distance=indoors frequency=auto mode=ap-bridge security-profile=nycmeshnet ssid=("nycmesh-" . $nodenumber . "-omni")  wireless-protocol=802.11 wps-mode=disabled
add disabled=no master-interface=wlan1 name=wlan2 ssid="-NYC Mesh Community WiFi-" wps-mode=disabled

/interface bridge
add auto-mac=yes name=publicaccess
add auto-mac=yes name=tenants


/ip address
add address=($ipprefix . ".1/25") interface=tenants network=($ipprefix . ".0")
add address=($ipprefix . ".129/26") interface=publicaccess network=($ipprefix . ".128")

/interface bridge port
add bridge=tenants interface=ether1
add bridge=tenants interface=ether2
add bridge=tenants interface=ether3
add bridge=tenants interface=ether4
add bridge=tenants interface=wlan1
add bridge=publicaccess interface=wlan2


/ip pool
add name=tenants ranges=$iptenantsrange
add name=publicaccess ranges=$ippublicrange


/ip dhcp-server
add address-pool=tenants disabled=no interface=tenants name=tenantsdhcp
add address-pool=publicaccess disabled=no interface=publicaccess name=publicaccessdhcp


/routing bgp instance
set default as=$bgpasn disabled=no


/routing bgp network
add network=($ipprefix . ".0/24") synchronize=no


/ip dhcp-server network
add address=($ipprefix . ".0/25") dns-server=10.10.10.10 gateway=($ipprefix . ".1") netmask=25
add address=($ipprefix . ".128/26") dns-server=10.10.10.10 gateway=($ipprefix . ".129") netmask=25


/ip firewall filter
add action=accept chain=input protocol=icmp
add action=drop chain=forward in-interface=publicaccess out-interface=tenants
add action=drop chain=input in-interface=publicaccess
add action=accept chain=forward
add action=accept chain=input


/system clock set time-zone-name=America/New_York
/system identity set name=("nycmesh-" . $nodenumber . "-omni")



##Better Music##

:local n11 63,66;
:local n12 64,67;
:local n21 71,69,68,69,68,66,68,64,66,63;
:local n22 64,63;

:local n11 ($n11,$n11);
:local n12 ($n12,$n12);
:local n1 ($n11,$n11,$n12,$n12);
:local n2 ($n21,$n22,$n22,$n22);
:local notes ($n1,$n1,$n2,$n2);
  
:local ticks 2;
:local speed 55ms;
:local stacc 5ms;

:local transpose -48;
:local frqtab 8372,8869,9397,9956,10548,11175,11839,12543,13288,14080,14916,15804;
:local n0; :local n;
:local d0; :local d;
:local l;
:local midi;
:local i;
:local octa;
:local frq;
:for i from=0 to= ([:len $notes]-1) do={
:set midi [:pick $notes $i];
:set midi ($midi + $transpose);
:set octa 0;
:while ( $midi < 60) do={:set midi ($midi + 12); :set octa ($octa + 1   ); };
:set midi ($midi - (12 * ($midi /12)));
:set frq [:tonum [:pick $frqtab $midi]];
:set frq ($frq>>($octa));
:set d0 $ticks;
:set d ($d0 * $speed );
:set l ($d0 * ($speed - $stacc));
:beep fr=$frq le=$l;
:delay $d;
:set midi 59;
:set midi ($midi + $transpose);
:set octa 0;
:while ( $midi < 60) do={:set midi ($midi + 12); :set octa ($octa + 1   ); };
:set midi ($midi - (12 * ($midi /12)));
:set frq [:tonum [:pick $frqtab $midi]];
:set frq ($frq>>($octa));
:set d0 $ticks;
:set d ($d0 * $speed );
:set l ($d0 * ($speed - $stacc));
:beep fr=$frq le=$l;
:delay $d;
}
```
</details>

### How to apply config:
1.   Acquire config parameters ( BGP ASN, IP range, node number, etc. )
2.   Fill in config file parameters at the top of the script.  
      Save as __nycmesh-omni-####.rsc__ where #### is your node number.  
      The file must be named with `.rsc` at the end.  
*   Factory Reset device if needed ( see [MikroTik Specifics](/hardware/mikrotikspecifics) for details )  
    _( Connect to a port besides Port 1 )_  
*   Update firmware to latest on your device ( see [Mikrotik Firmware](/software/mikrotikfirmware) )  
*   Upload the rsc file  
      *   The file needs to be in the `flash/` folder. However, there is no way to create a folder from the device.
      *   Instead you need to upload the file using scp.
      *   From a Mac or Linux desktop, upload the file using scp:  
          `scp nycmesh-omni-####.rsc admin@192.168.88.1:flash/`  
          You may need to confirm the SSH key ( typical with SSH )
      * You should see the file in the WebUI as `flash/nycmesh-omni-####.rsc`
*   Factory Reset the device with the option to restore this script.
      * From Web UI:
          * WebFig > System > Reset Configuration. Select:
          * No Defaults
          * Run After Reset: `flash/nycmesh-omni-####.rsc`
          * Apply
      * Or from CLI:
          * `/system reset-configuration run-after-reset=flash/nycmesh-omni-####.rsc no-defaults=yes`
          * Dangerous Reset anyway? Y
