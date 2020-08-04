EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R1
U 1 1 5EE13BA3
P 5000 2500
F 0 "R1" H 5100 2550 50  0000 L CNN
F 1 "R" H 5100 2500 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4930 2500 50  0001 C CNN
F 3 "~" H 5000 2500 50  0001 C CNN
	1    5000 2500
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATmega:ATmega32U4-AU U2
U 1 1 5EF38BC6
P 8500 3250
F 0 "U2" H 8500 1325 50  0000 C CNN
F 1 "ATmega32U4-AU" H 8500 1225 50  0000 C CNN
F 2 "Package_QFP:TQFP-44_10x10mm_P0.8mm" H 8500 3250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf" H 8500 3250 50  0001 C CNN
	1    8500 3250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2112K-3.3 U1
U 1 1 5EF3B71C
P 2750 2500
F 0 "U1" H 2750 2900 50  0000 C CNN
F 1 "AP2112K-3.3" H 2750 2800 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 2750 2825 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 2750 2600 50  0001 C CNN
	1    2750 2500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
