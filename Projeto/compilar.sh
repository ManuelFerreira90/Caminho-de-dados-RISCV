#!/bin/bash
python3 Montador_assembly/main.py
iverilog main.v 
vvp a.out
gtkwave wavefile.vcd 