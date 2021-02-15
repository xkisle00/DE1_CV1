# **Lab assignment**

## 1. Link to my repository :
https://github.com/xkisle00/Digital-electronics-1



## 2. Verification of De Morgan's laws :

### Code :

```vhdl

architecture dataflow of gates is
begin
    f_o     <= ((not b_i) and a_i) or ((not c_i)and (not b_i));
    fnand_o <= not (not (not b_i and a_i) and not (not b_i and not c_i));
    fnor_o  <= not (b_i or not a_i) or not (c_i or b_i);

end architecture dataflow;

```
### Screeshot :
![De Morganov zakon](/obrazky/screen1.png)

### Table :

| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 |  |
| 0 | 0 | 1 |  |
| 0 | 1 | 0 |  |
| 0 | 1 | 1 |  |
| 1 | 0 | 0 |  |
| 1 | 0 | 1 |  |
| 1 | 1 | 0 |  |
| 1 | 1 | 1 |  |

### Link na EDA playground :
https://www.edaplayground.com/x/KWay


## 3. Verification of Distributive laws :

### Code :

### Screeshot :

### Link na EDA playground :

