# 4. Lab assignment
## 1. Preparation tasks (done before the lab at home). Submit:

#### Figure or table with connection of push buttons on Nexys A7 board
| Button | Connection | ON | OFF |
| :-: | :-: | :-: | :-: |
| AN7 | U13 |AN7 | U13 |
| AN6 | K2 | AN7 | U13 |
| AN5 | T14 | AN7 | U13 |
| AN4 | P14 | AN7 | U13 |
| AN3 | J14 | AN7 | U13 |

#### Table with calculated values.
 | **Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** |
  | :-: | :-: | :-: | :-: |
  | 2&nbsp;ms | 200 000 | `x"3_0d40"` | `b"0011_0000_1101_0100_0000"` |
  | 4&nbsp;ms |
  | 10&nbsp;ms |
  | 250&nbsp;ms |
  | 500&nbsp;ms |
  | 1&nbsp;sec | 100 000 000 | `x"5F5_E100"` | `b"0101_1111_0101_1110_0001_0000_0000"` |

## 2. Bidirectional counter. Submit:
#### Listing of VHDL code of the process `p_cnt_up_down` with syntax highlighting.
#### Listing of VHDL reset and stimulus processes from testbench file `tb_cnt_up_down.vhd` with syntax highlighting and asserts,
#### Screenshot with simulated time waveforms; always display all inputs and outputs,

## 3. Top level. Submit:
#### Listing of VHDL code from source file `top.vhd` with all instantiations for the 4-bit bidirectional counter.
#### Image of the top layer including both counters, ie a 4-bit bidirectional counter from Part 4 and a 16-bit counter with a 10 ms time base from Part Experiments on your own. The image can be drawn on a computer or by hand.


