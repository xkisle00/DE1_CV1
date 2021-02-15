# De Morganov zakon

```vhdl

architecture dataflow of gates is
begin
    f_o     <= ((not b_i) and a_i) or ((not c_i)and (not b_i));
    fnand_o <= not (not (not b_i and a_i) and not (not b_i and not c_i));
    fnor_o  <= not (b_i or not a_i) or not (c_i or b_i);

end architecture dataflow;

```

![Screenshot De Morganovho zakona](obrazky/screen1.png)

## Link na EDA playground :
https://www.edaplayground.com/x/KWay
