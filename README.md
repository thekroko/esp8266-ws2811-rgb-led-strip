# esp8266-ws2811-rgb-led-strip
NodeMCU based code for a HTTP based control for WS2811 LEDs

Features:
* Supports multiple WIFI setups; automatically hops between WiFis until the first working one is found
* Simple control of the WS2811 RGB LED strip using a HTTP server and query-parameter based requests
* Supports arbitrary length hex patterns: 
  * Can set all LEDs to the same color
  * Can e.g. alternate two colors
  * Can send one color per LED

## Requirements
An ESP8266 module running NodeMCU, a blank filesystem, and one free pin

## Installation
1. Make sure your ESP8266 module is running NodeMCU. Flash if not.
1. Connect the WS2811 to pin GPIO2 (or change the mapping in rgb.lua)
1. Set up rgb.lua for the number of LEDs you have
1. Put all `*.lua` files on the ESP8266 by e.g. using ESPlorer.
1. Restart your ESP8266

## Usage
Webserver is running on port 80 after the module has started up. When a WiFi network is initially found, a "red-green-blue" test pattern is shown across the LED strip. If the strip remains dark, the module is not yet connected to your wifi.

* To set the RGB strip to red, call: `http://ip_of_esp/?FF0000`
* To set the RGB strip to white, call: `http://ip_of_esp/?FF`
* To set the RGB strip to alternate between red and green, call: `http://ip_of_esp/?FF0000,00FF00` (comma can be omitted)
