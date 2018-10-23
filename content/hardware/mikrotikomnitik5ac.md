---
title: "MikroTik OmniTik 5ac"
---

The Omnitik 5ac is an outdoor switch/router with a built-in 5Ghz 802.11ac access point, omnidirectional antenna, and 5 gigabit ethernet ports.

_Please be sure to see [MikroTik Specifics](/hardware/mikrotikspecifics) for extra info about Mikrotik devices, how to connect, etc._

![MikroTik OmniTik PoE 5ac Front View](/img/hardware/mikrotik_omnitik5poeac_front.jpg)

The PoE version accepts 12-57V passive PoE on port 1 and can be configured to provide PoE out to ports 2-5.

![MikroTik OmniTik PoE 5ac Ports](/img/hardware/mikrotik_omnitik5poeac_ports.jpg)

Device specs are available at [mikrotik.com](https://mikrotik.com/product/rbomnitikpg_5hacd).

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

:for j from=1 to=4 step=1 do={
  :for i from=2000 to=50 step=-400 do={
    :beep frequency=$i length=11ms;
    :delay 11ms;
  }
  :for i from=800 to=2000 step=400 do={
    :beep frequency=$i length=11ms;
    :delay 11ms;
  }
}

:foreach x in=[/interface wireless find] do={ /interface wireless reset-configuration $x }

:for t from=1200 to=350 step=-50 do={
  :beep frequency=$t length=33ms;
  :delay 33ms;
}

:beep frequency=500 length=100ms

/ip address add address=192.168.88.1/24 interface=ether3 network=192.168.88.0

:beep frequency=600 length=100ms

/interface ethernet
set [ find default-name=ether5 ] poe-out=forced-on

:beep frequency=700 length=100ms

/interface wireless security-profiles
add authentication-types=wpa-psk,wpa2-psk management-protection=allowed mode=\
    dynamic-keys name=nycmeshnet supplicant-identity=nycmesh \
    wpa-pre-shared-key=nycmeshnet wpa2-pre-shared-key=nycmeshnet

:beep frequency=800 length=100ms

/interface wireless
set [ find default-name=wlan1 ] band=5ghz-a/n/ac channel-width=20/40/80mhz-Ceee disabled=no distance=indoors frequency=auto mode=ap-bridge security-profile=nycmeshnet ssid=("nycmesh-" . $nodenumber . "-omni")  wireless-protocol=802.11 wps-mode=disabled
add disabled=no master-interface=wlan1 name=wlan2 ssid="-NYC Mesh Community WiFi-" wps-mode=disabled

:beep frequency=900 length=100ms

/interface bridge
add auto-mac=yes name=publicaccess
add auto-mac=yes name=tenants

:beep frequency=1000 length=100ms

/ip address
add address=($ipprefix . ".1/25") interface=tenants network=($ipprefix . ".0")
add address=($ipprefix . ".129/26") interface=publicaccess network=($ipprefix . ".128")

:beep frequency=1100 length=100ms

/interface bridge port
add bridge=tenants interface=ether1
add bridge=tenants interface=ether2
add bridge=tenants interface=ether3
add bridge=tenants interface=ether4
add bridge=tenants interface=wlan1
add bridge=publicaccess interface=wlan2

:beep frequency=1200 length=100ms

/ip pool
add name=tenants ranges=$iptenantsrange
add name=publicaccess ranges=$ippublicrange

:beep frequency=1300 length=100ms

/ip dhcp-server
add address-pool=tenants disabled=no interface=tenants name=tenantsdhcp
add address-pool=publicaccess disabled=no interface=publicaccess name=publicaccessdhcp

:beep frequency=1400 length=100ms

/routing bgp instance
set default as=$bgpasn disabled=no

:beep frequency=1500 length=100ms

/routing bgp network
add network=($ipprefix . ".0/24") synchronize=no

:beep frequency=1600 length=100ms

/ip dhcp-server network
add address=($ipprefix . ".0/25") dns-server=10.10.10.10 gateway=($ipprefix . ".1") netmask=25
add address=($ipprefix . ".128/26") dns-server=10.10.10.10 gateway=($ipprefix . ".129") netmask=25

:beep frequency=1700 length=100ms

/ip firewall filter
add action=accept chain=input protocol=icmp
add action=drop chain=forward in-interface=publicaccess out-interface=tenants
add action=drop chain=input in-interface=publicaccess
add action=accept chain=forward
add action=accept chain=input

:beep frequency=1800 length=100ms

/system clock set time-zone-name=America/New_York
/system identity set name=("nycmesh-" . $nodenumber . "-omni")

:beep frequency=500 length=200ms;
:delay 500ms;
:beep frequency=500 length=200ms;
:delay 200ms;
:beep frequency=800 length=500ms;
:delay 50ms;
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
