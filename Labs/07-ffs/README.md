# 7. Lab assignment

## 1. Preparation tasks :
#### Characteristic equations and completed tables for D, JK, T flip-flops :

<!--
\begin{align*}
    q_{n+1}^D = &~ d &\\
    q_{n+1}^{JK} = &~ j\cdot \overline{q_n}\ +\overline{k}\cdot q_n &\\
    q_{n+1}^T =&~ t\cdot \overline{q_n}\ +\overline{t}\cdot q_n &\\
\end{align*}-->

   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 0 | Sampled and stored |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 0 | Sampled and stored |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 1 | Sampled and stored |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 1 | Sampled and stored |

   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 0 | 0 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 1 | 1 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 0 | 0 | Reset |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 1 | 0 | Reset |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 0 | 1 | Set |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 1 | 1 | Set |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 0 | 1 | Toggle (=invert) |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 1 | 0 | Toggle (=invert) |

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 0 | 0 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 0 | 1 | 1 | No change |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 0 | 1 | Toggle (=invert) |
   | ![rising](/obrazky/eq_uparrow.png) | 1 | 1 | 0 | Toggle (=invert) |


## 2. D latch :
#### VHDL code listing of the process `p_d_latch` with syntax highlighting :
```vhdl

```
#### Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch` file with syntax highlighting and asserts :
```vhdl

```
#### Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entity must be verified.
![screenshot](/obrazky/cv7_screen1.png)

## 3. Flip-flops :
#### VHDL code listing of the processes `p_d_ff_arst`, `p_d_ff_rst`, `p_jk_ff_rst`, `p_t_ff_rst` with syntax highlighting :
```vhdl

```
#### Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts :
```vhdl

```
#### Screenshot, with simulated time waveforms :
![screenshot](/obrazky/cv7_screen2.png)

## 4. Shift register :
#### Image of the shift register schematic :
![obrazok](/obrazky/cv7_nakreslene.jpg)
