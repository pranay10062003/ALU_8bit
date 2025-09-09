# ALU_4bit – Verilog + Cocotb Testbench

## 📝 Project Description
This project implements a simple **4-bit ALU** (Arithmetic Logic Unit) in Verilog.  
The ALU supports arithmetic, logic, and comparison operations selected using a 4-bit control input (`ena`).

A **Cocotb testbench** is provided to simulate and verify the ALU functionality.

---

## 🔧 ALU Features

The ALU takes two 4-bit inputs (`ui_in` and `uio_in`) and a 4-bit control signal (`ena`).  
The result is given on the 8-bit output (`uo_out`).

### Supported Operations

| `ena` (opcode) | Operation             | Description                                    |
|----------------|-----------------------|------------------------------------------------|
| `0000`         | ADD                   | `uo_out = ui_in + uio_in`                      |
| `0001`         | SUB                   | `uo_out = ui_in - uio_in`                      |
| `0010`         | MUL                   | `uo_out = ui_in * uio_in`                      |
| `0011`         | DIV                   | `uo_out = ui_in / uio_in` (integer division)   |
| `0100`         | AND                   | `uo_out = ui_in & uio_in`                      |
| `0101`         | OR                    | `uo_out = ui_in | uio_in`                      |
| `0110`         | NOT (ui_in)           | `uo_out = ~ui_in`                              |
| `0111`         | NOT (uio_in)          | `uo_out = ~uio_in`                             |
| `1000`         | SQUARE (ui_in)        | `uo_out = ui_in * ui_in`                       |
| `1001`         | SQUARE (uio_in)       | `uo_out = uio_in * uio_in`                     |
| `1010`         | LESS THAN             | `uo_out = 0xFF if ui_in < uio_in else 0`       |
| `1011`         | EQUAL                 | `uo_out = 0xFF if ui_in == uio_in else 0`      |
| `1100`         | GREATER THAN          | `uo_out = 0xFF if ui_in > uio_in else 0`       |

---

## 📂 Repository Structure

