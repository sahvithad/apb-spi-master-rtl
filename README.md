# Verilog RTL Practice

Small digital-design examples with separate RTL and testbench files.

## Included
1. `comparator_2bit.v` — 2-bit magnitude comparator with `gt`, `eq`, and `lt` outputs.
2. `tb_comparator_2bit.v` — exhaustive testbench for all 16 input combinations.
3. `up_down_counter.v` — parameterized synchronous up/down counter with synchronous reset and enable.
4. `tb_up_down_counter.v` — basic directed testbench.

## Run with Icarus Verilog
Install Icarus Verilog, then run:

```bash
iverilog -o comparator_sim comparator_2bit.v tb_comparator_2bit.v
vvp comparator_sim

iverilog -o counter_sim up_down_counter.v tb_up_down_counter.v
vvp counter_sim
```

For waveforms, add `$dumpfile` and `$dumpvars` in a testbench and open the VCD file in GTKWave.

## Before using this as a portfolio project
- Run the simulations yourself.
- Inspect the waveforms and explain each test case.
- Add your own observations and screenshots after verifying the outputs.
