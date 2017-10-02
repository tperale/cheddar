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

Amazon create not a long time ago connected buttons that allow you to pass
order on amazon just by pressing a button. Its goal is to facilitate the
process of buying household objects.
It took not a long time for hackers to appropriate the object and use it for
other purposes:

  * [Hacking Amazon’s $5 Dash Button to order Domino’s Pizza](https://medium.com/@brody_berson/hacking-amazon-s-5-dash-button-to-order-domino-s-pizza-9d19c9d04646)
  * [How To Use the Amazon Dash with IFTTT and Home Assistant](https://www.youtube.com/watch?v=qZpJ9W0wCks)

All you needed was to buy one, get the button ID through the Amazon app and
encode that ID to the _whatever_ listen to incoming query.
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
run on battery, can be programmable is internet connected and is powered only
when you press on the button.

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
