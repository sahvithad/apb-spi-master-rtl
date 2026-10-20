# APB-Interfaced SPI Master IP Core — RTL Design

## Project Overview
This project focuses on the design and verification concepts of an SPI (Serial Peripheral Interface) Master IP Core with an AMBA APB (Advanced Peripheral Bus) interface.

The APB interface provides a memory-mapped method for configuring and controlling SPI transfers, while the SPI master manages serial communication with a peripheral device.

## Key Functional Blocks
- **APB Interface:** Handles bus transactions and access to control/status registers.
- **Control Unit:** Coordinates SPI transfer operations.
- **Shift Register:** Supports serial data transmission and reception.
- **Clock Generator:** Generates the SPI serial clock.
- **Slave Select Logic:** Selects the target SPI peripheral.
- **Control and Status Registers:** Store configuration and report peripheral status.

*The blocks listed above describe the intended architecture; confirm that each is present in your actual implementation.*

## Verification Approach
Verification of an SPI master design can include:
- APB read and write transactions
- Reset behavior and register access
- Serial data transmission and reception
- SPI clock and slave-select behavior
- Transfer completion and status reporting

## Tools and Technologies
- Verilog HDL / RTL design
- Digital logic design
- APB and SPI protocol concepts
- RTL simulation and waveform analysis

## My Contribution
Add a concise description of the RTL design, testbench development, debugging, and verification tasks personally completed during the Maven Silicon project.

## Project Status
Project documentation and technical details are being organized for portfolio presentation. Only source code, diagrams, and verification results that I am authorized to share will be published.

## Disclaimer
This repository documents my project experience and technical learning. Any internship-related materials will be shared only where permission has been granted.
