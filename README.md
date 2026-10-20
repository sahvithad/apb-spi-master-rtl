# Parameterized Synchronous FIFO

A small RTL design demonstrating circular-buffer pointers, occupancy tracking, and full/empty status.

## Files
- `sync_fifo.v` — synthesizable Verilog RTL
- `tb_sync_fifo.v` — basic self-checking testbench

## Run with Icarus Verilog
```bash
iverilog -g2012 -o fifo_sim sync_fifo.v tb_sync_fifo.v
vvp fifo_sim
```

## Design notes
- Single clock, synchronous active-high reset
- Parameterized data width and depth
- `wr_en` is accepted only when not full
- `rd_en` is accepted only when not empty
- Read data is registered on a successful read

Run the testbench before reporting its outcome.
