+++
title = "Personal VHDL library"
description = "A collection of VHDL components and utilities that can be used in various projects. The library reflects my personal learning journey and is not intended for commercial use."
date = 2026-01-22
[taxonomies]
tags = ["vhdl", "hardware"]
[extra]
status = "Active"
+++

## What is it?

The library is available on [GitHub](https://github.com/ThomasPais/vhdl-library). The documentation is automatically generated from the source code using [TerosHDL](https://terostechnology.github.io/terosHDLdoc/). If you find any issues or have suggestions for improvement, please feel free to open an issue on the Github repository or to contact me.

Each component is documented and verified but **only in simulation for now**. I plan to buy a Xilinx FPGA board to also verify them in hardware. I also plan to add an estimation of the resource usage for each component.

## How to use it?

I don't plan to provide a true library file. Instead, you can copy the individual components you need from the repository and integrate them into your project.

I find this method more flexible because it allows you to customize the library to your specific needs or platform and avoid unnecessary dependencies.

## Components lists

The current version of the library includes the following components:

### Cross domain crossing

- Double flop synchronizer
- Pulse synchronizer

### Future plans

- Bus synchronizers
- FIFOs
- AXI/AXI-Lite/AXI-Stream bridges
- DMAs
- FIR and IIR filters
