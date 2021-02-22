# **Lab 2: Combinational logic**

## Preparation tasks

### Truth table

| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

### SoP
![De Morganov zakon](/obrazky/CodeCogsEqn.gif)
### PoS
![De Morganov zakon](/obrazky/lessPoS.gif)


## A 2-bit comparator

### K-map for the "equals" function :
![De Morganov zakon](/obrazky/B=A.png)


### K-map for simplified SoP form of the "greater than" function :
![De Morganov zakon](/obrazky/BVA.png)
![De Morganov zakon](/obrazky/greater_SoP.gif)


### K-map for simplified PoS form of the "less than" function :
![De Morganov zakon](/obrazky/BAA.png)
![De Morganov zakon](/obrazky/less_PoS.gif)


### Equations

### Link : 
https://www.edaplayground.com/x/tEsu

### A 4-bit binary comparator

### VHDL architecture from design file

### VHDL stimulus process from testbench file

### Simulator console output

### Link :




