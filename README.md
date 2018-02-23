<h1 align="center">Cheddar</h1>
<h6 align="center">
  <a href="https://en.wikipedia.org/wiki/Cheddar_cheese">
    <img  src="https://upload.wikimedia.org/wikipedia/commons/1/18/Somerset-Cheddar.jpg"
        height="64"
        width="64">
  </a>
</h6>
<p align="center">
<sup>
      <strong>Cheddar</strong> is a connected button based on the ESP8266.
</sup>
<br>

## What is this ?

Amazon created not a long time ago a connected buttons (called dash buttons) that allow you to make
order on amazon just by pressing a single button. Its goal is to facilitate the
process of buying household objects.
It took not a long time for hackers to appropriate the object and use it for
other purposes:

  * [Hacking Amazon’s $5 Dash Button to order Domino’s Pizza](https://medium.com/@brody_berson/hacking-amazon-s-5-dash-button-to-order-domino-s-pizza-9d19c9d04646)
  * [How To Use the Amazon Dash with IFTTT and Home Assistant](https://www.youtube.com/watch?v=qZpJ9W0wCks)

All you needed was to buy one, get the button ID through the Amazon app and
encode that ID to _whatever_ listen to incoming query.
Amazon delivered you a 5$ connected piece of hardware, battery and case
included that allow you to virtually do anything with.

The problem of the Dash button design are:

  * You need an amazon premium account to purchase and get the button ID.
  * You can't directly program on it, which make complex query more difficult
      to run and embedding sensors impossible.
  * You need a server running somewhere locally to listen to the incoming
      queries.

## What to do ?

Why not create our own open source "Amazon Dash button". It has to also
run on battery, can be programmable and is internet connected.

Why not use an ESP8266 microcontroller for this purpose, it's used in a wide
variety of projects, many framework are developped for it and is also really
cheap.

Power an ESP8266 dev board with battery and wake it up when the button is
triggered is a quite trivial problem. That's why I choosed to create a PCB to
host the ESP8266 module. Although it has some requirements:

  * Be able to program it and debug it from USB
  * Can run on batteries
  * Can charge batteries from it by USB
  * Be power efficient

## BOM

### Semiconductors

Ref | Qty | Value | Footprint
----|-----|-------|---------------
U2 | 1 | ch340g | SO-16-N
U3 | 1 | MCP73831 | SOT23-5
U4 | 1 | HT7333 | SOT89
U1 | 1 | ESP-12E | ESP-12E_SMD

### Capacitors

Ref | Qty | Value | Footprint
----|-----|-------|---------------
C2, C3 | 2 | 22pF | 1206
C4, C8 | 2 | 100nF | 1206
C5 | 1 | 10nF | 1206
C6 | 1 | 22nF | 1206
C7 | 1 | 1uF  | 1206
C9, C1 | 2 | 220uF | 1206

### Transistors

Ref | Qty | Value | Footprint
----|-----|-------|---------------
Q1  | 1   | MOSFET_PCH | SOT23-3

### Resistors

Ref | Qty | Value | Footprint
----|-----|-------|---------------
R1 | 1 | 470R | 1206
R3, R5, R6, R7, R8 | 5 | 10kR | 1206
R9 | 1 | 100kR

### Crystals

Ref | Qty | Value | Footprint
----|-----|-------|---------------
Y1 | 1 | 12Mhz | Crystal_SMD_3225-4pin_3.2x2.5mm_HandSoldering

### Diodes

Ref | Qty | Value | Footprint
----|-----|-------|---------------
D1 | 1 | GREEN | 1206
D4 | 1 | Schottky | SOT23

### Connectors

Ref | Qty | Footprint
----|-----|---------------
J1 | 1 | Connectors_JST:JST_SH_SM02B-SRSS-TB_02x1.00mm_Angled
J2 | 1 | Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm_SMD_Pin1Left
J3 | 1 | Connectors_USB:USB_Micro-B_Molex_47346-0001
J5 J4 | 2 | Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm

### Switch

Ref | Qty | Footprint
----|-----|---------------
SW1 | 1 | Buttons_Switches_SMD:SW_DIP_x1_W5.08mm_Slide_Copal_CHS-A

## References

* [Long lasting DIY "Amazon Dash Button" using an ESP8266](https://www.youtube.com/watch?v=nbMfb0dIvYc&t=307s)
* [Cheap IFTTT Button with spare ESP-01 finished](https://www.youtube.com/watch?v=6JD2RMDM88Y)
* [How to properly power the ESP8266 modules](https://www.youtube.com/watch?v=wf_msvWv1jk)
* [ESP8266 Wiki - Boot Mode Selection](https://github.com/espressif/esptool/wiki/ESP8266-Boot-Mode-Selection)
* [CH340G - USB-UART Chip](http://www.sunrom.com/p/ch340g)

## Useful links / similar projects

* [1btn](https://github.com/knewron-technologies/1btn)
* [goButton](https://www.kickstarter.com/projects/805606890/gobutton-simple-wi-fi-connected-smart-button-for-e/description)
* [ESP8266-Dash-Button](https://github.com/DeqingSun/ESP8266-Dash-Button)

## Collaborators

* [carlosgeos](https://github.com/carlosgeos)

## License

[Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/)
