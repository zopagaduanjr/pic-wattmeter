'Symbol comp_change = PIR1.CMIF  'comparator interrupt flag
VRCON = 0xec  'turn on, configure voltage reference module for 2.5V and connect it to RA2
TRISB = 0x00  'set PORTB pins as outputs
TRISA = 0x05  'set RA0, RA2 and RA3 as inputs, other PORTA pins as outputs
Dim counter As Word
Dim result As Word
Dim thousands As Byte
Dim hundreds As Byte
Dim tens As Byte
Dim ones As Byte
Dim i As Byte
main:
Gosub loop1
For i = 0 To 99  '1 second show of adc
PORTB = LookUp(3fh, 06h, 5bh, 4fh, 66h, 6dh, 7dh, 07h, 7fh, 67h), thousands
PORTA = b7h
'WaitMs 5
PORTB = LookUp(3fh, 06h, 5bh, 4fh, 66h, 6dh, 7dh, 07h, 7fh, 67h), hundreds
PORTA = 77h
'WaitMs 5
PORTB = LookUp(3fh, 06h, 5bh, 4fh, 66h, 6dh, 7dh, 07h, 7fh, 67h), tens
PORTA = f5h
'WaitMs 5
PORTB = LookUp(3fh, 06h, 5bh, 4fh, 66h, 6dh, 7dh, 07h, 7fh, 67h), ones
PORTA = e7h
'WaitMs 5
Next i
Goto main
End                                               
loop1:
ones = 0
tens = 0
hundreds = 0
thousands = 0
CMCON = 0x06
counter = 0
result = 0
isvrefgreaterthanvrao:
While RA3  'Yes
counter = counter + 1  'Increment Counter
If counter = 1024 Then Goto ending
Wend
'No
'RA3 is automatically set to off if RAO is greater than 2.50V
result = result + 1  'Increment Result
counter = counter + 1
If counter = 1024 Then Goto ending
If counter < 1024 Then Goto isvrefgreaterthanvrao
ending:
CMCON = 03h
ones = result Mod 10
tens = (result / 10) Mod 10
hundreds = (result / 100) Mod 10
thousands = (result / 1000) Mod 10
Return                                            