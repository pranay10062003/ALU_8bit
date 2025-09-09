# SPDX-FileCopyrightText: © 2024
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_alu_4bit(dut):
    dut._log.info("Start ALU 4-bit test")

    # Apply inputs
    dut.ui_in.value = 0b1110  # 14
    dut.uio_in.value = 0b1001 # 9

    # Define some test cases (ena, expected_output)
    tests = [
        (0b0000, 14 + 9),        # ADD
        (0b0001, 14 - 9),        # SUB
        (0b0010, 14 * 9),        # MUL
        (0b0011, 14 // 9),       # DIV
        (0b0100, 14 & 9),        # AND
        (0b0101, 14 | 9),        # OR
        (0b0110, (~14) & 0xF),   # NOT ui_in (mask to 4-bit)
        (0b0111, (~9) & 0xF),    # NOT uio_in
        (0b1000, 14 * 14),       # ui_in squared
        (0b1001, 9 * 9),         # uio_in squared
        (0b1010, 0xFF if 14 < 9 else 0),   # less than
        (0b1011, 0xFF if 14 == 9 else 0),  # equal
        (0b1100, 0xFF if 14 > 9 else 0),   # greater than
    ]

    # Run each test
    for ena_val, expected in tests:
        dut.ena.value = ena_val
        await Timer(10, units="ns")  # wait for combinational settle

        got = int(dut.uo_out.value)
        dut._log.info(f"ena={ena_val:04b} | got={got} | expected={expected}")

        assert got == expected, f"Test failed for ena={ena_val:04b}: got {got}, expected {expected}"
