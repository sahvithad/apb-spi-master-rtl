# SPI Master Controller — RTL Design Using Verilog HDL

## Project Overview

This project implements an SPI (Serial Peripheral Interface) Master Controller using Verilog HDL. It demonstrates synchronous digital design, finite-state machine (FSM) control, serial data transmission, clock generation, and hardware interface design.

This repository contains a recreated educational implementation inspired by a standard SPI Master architecture; it is not the original Maven Silicon source code.

## Key Features

- SPI Master controller design using Verilog HDL
- Serial data transmission through MOSI
- Serial data reception through MISO
- SPI clock (SCLK) generation using a configurable clock divider
- Active-low chip-select control
- Start, busy, and transfer-completion signals
- 8-bit serial data transfers
- SPI Mode 0 timing (CPOL = 0, CPHA = 0)
- Testbench for functional simulation

## Design Architecture

The controller uses an FSM to manage the transfer process.

1. **Idle State:** Waits for a start request while keeping the SPI clock low and chip select inactive.
2. **Transfer State:** Activates chip select, shifts transmitted data through MOSI, samples received data through MISO, and generates the SPI clock.
3. **Completion:** Updates the received data, signals transfer completion, and deactivates chip select.

## Technologies Used

- Verilog HDL
- RTL Design
- Digital Logic Design
- Finite State Machines
- Serial Communication Protocols
- Functional Simulation

## Verification

A Verilog testbench is included to exercise an SPI transfer and check the received data.

**Verification status:** Simulation has not yet been run and confirmed.

## Applications

- Embedded systems
- Microcontroller-to-peripheral communication
- Sensor interfaces
- Digital system integration
- Hardware protocol controller design

## Future Enhancements

- Support for SPI Modes 1, 2, and 3
- Configurable data width
- Multiple slave-select outputs
- Back-to-back transfers
- SystemVerilog assertions and randomized verification

## Project Relevance

This project demonstrates foundational skills in RTL design, FSM implementation, serial interface protocols, and functional verification relevant to digital design and hardware engineering..
