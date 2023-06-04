#!/bin/bash

iverilog testbench.v 
vvp a.out
gtkwave testbench.vcd 