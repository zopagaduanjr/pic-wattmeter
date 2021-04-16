# PIC Wattmeter

A low-cost approach on a Wattmeter using a single-phase split-core current transformer and PIC16F628A. The prototype performed the most accuracy when the Input Voltage is around 4 to 5 Volts.

![prototype_gif](media/prototype.gif)

## Description

The project utilizes the built-in comparator of PIC16. The configuration charges to capacitors up to 2.5 Volts then discharges and recharges it for 1024 cycles to achieve a 10-bit resolution accuracy.

## Delta-Sigma Program

![flow 1](media/flow_1.png)
![flow 2](media/flow_2.png)
![flow 3](media/flow_3.png)

## Schematic

![schematic](media/board_2.png)
![board](media/board_3.png)

## Prototype

![prototype](media/prototyping_a.jpg)

## Result

| voltmeter reading | adc voltage | adc reading |
| ----------------- | ----------- | ----------- |
| 1.98              | 2.04        | 409         |
| 1.96              | 2.09        | 419         |
| 1.96              | 2.09        | 419         |
| 1.97              | 2.09        | 419         |
| 1.97              | 2.09        | 419         |
| 1.97              | 2.09        | 419         |
| 1.97              | 2.09        | 419         |
| 1.98              | 2.04        | 409         |
