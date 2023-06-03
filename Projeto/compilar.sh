#!/bin/bash

iverilog main.v 
vvp a.out
gtkwave wavefile.vcd 