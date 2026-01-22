+++
title = "Personal VHDL library"
description = "A collection of VHDL components and utilities for various FPGA projects."
date = 2026-01-22
[taxonomies]
tags = ["vhdl", "hardware"]
[extra]
status = "Active"
+++

## What is it?

This library is a growing collection of hardware modules available on [GitHub](https://github.com/ThomasPais/vhdl-library). 

**Please note that this library reflects my personal learning journey; it is intended for educational purposes and is not designed for commercial use.**

The documentation is automatically generated from the source code using [TerosHDL](https://terostechnology.github.io/terosHDLdoc/), ensuring that the specifications stay in sync with the RTL. If you encounter any issues or have suggestions for improvements, please feel free to open an issue on the GitHub repository or contact me directly.

Every component is fully documented and has been **verified via simulation**. My next milestone is to perform hardware validation on Xilinx FPGA silicon. I also plan to include resource usage estimations (LUTs, FFs, BRAM) for each component to help with design planning.

## How to use it?

I have chosen not to provide a pre-compiled library file. Instead, you can simply copy the individual source files you need and integrate them directly into your project.

I find this "modular" approach more flexible for FPGA development. It allows you to:
* Customize components for your specific platform or constraints.
* Avoid unnecessary dependencies in your synthesis toolchain.
* Maintain a "lightweight" project structure by only including what you actually use.

## Component library

The current version of the library includes the following categories and modules:

### Clock Domain Crossing (CDC)

* **Double Flop Synchronizer** - A standard two-stage flip-flop chain to mitigate metastability for quasi-static signals.
* **Pulse Synchronizer** - A toggle-based synchronizer to safely pass single-cycle pulses between asynchronous clock domains.

### Future plans

I am actively working on expanding the library with the following components:

* **Bus Synchronizers**: For safely transferring multi-bit data between asynchronous clock domains.
* **FIFOs**: Both synchronous and asynchronous implementations.
* **AXI Infrastructure**: AXI4-Full, AXI4-Lite and AXI-Stream bridges for system integration.
* **DSP Modules**: FIR and IIR filters for digital signal processing.
* **Data Movement**: Basic DMA controllers for memory-to-memory transfers.
