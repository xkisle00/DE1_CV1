# 8. Lab assignment

## 1. Preparation tasks :
#### Completed state table :
| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ![rising](/obrazky/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) | ![rising](Images/eq_uparrow.png) |
| **State** | A |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
| **Output R** | `0` |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |

#### Completed table with color settings :
| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` |  |  |
| LD17 |  |  |  |  |

## 2. Traffic light controller :
#### State diagram :
#### Listing of VHDL code of sequential process `p_traffic_fsm` with syntax highlighting :
```vhdl

```
#### Listing of VHDL code of combinatorial process `p_output_fsm` with syntax highlighting :
```vhdl

```
#### Screenshot(s) of the simulation, from which it is clear that controller works correctly :
![screenshot](/obrazky/cv7_screen1.png)
![obrazok](/obrazky/cv7_nakreslene.jpg)

#### Listing of VHDL architecture of the top layer :

## 3. Smart controller :
#### State table :
#### State diagram :
#### Listing of VHDL code of sequential process `p_smart_traffic_fsm` with syntax highlighting :
```vhdl

```
