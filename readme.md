# Magiquest ESPHome Configurations

This repository is meant to accompany the guide here: https://youtu.be/6ElDx8rN_Po

The configurations in this repository allow you to trigger home assistant automations with Magiquest magic wands by receiving their IR signals with an ESP microcontroller + ESPHome.

You'll find the relevent templates in the `esphome-templates` directory

The `home-assistant-automations` directory is intended to become YAML definitions for examples of home assistant automations and scripts, but it needs work and I'm not certain how helpful it will be yet. Maybe it will get removed.

## Currently supported ESP devices (these have a template)

- ESP8266 (Wemos D1 Mini)
- ESP32 (ESP-WROOM-32)

## Tested ESP device models

| Type | Chip | Specific Model Tested | GPIO |
|------|------|-----------------------|------|
| ESP8266 | ESP-12F | Wemos D1 Mini clone - https://amzn.to/3zdG472 | GPIO2 |
| ESP32 | ESP32-WROOM-32 | ESP32-DevKitC-32 - https://amzn.to/3xBOYek | GPIO4 |

## 3D Printable Case

`esp8266_ir_case.scad` is a case designed for the Wemos D1 Mini

STL is available to download at Printables and Thingiverse which are both linked in the description of the video above.

This is the OpenSCAD file. You can use OpenSCAD to view/edit this file and convert into to an STL.
