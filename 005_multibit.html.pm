#lang pollen
◊slide{
◊h1{Multi bit Buses}
The gates you've finished building ◊em{And, Or, Not, Mux, and Demux}, all operated on ◊strong{individual} bits.

◊pre{
A ───────────────► B
       1 bit
}

But real computers frequently operate on ◊strong{groups} of bits simultaneously. For example, the computer we're building uses 16-bit values throughout its architecture. This concept is called a ◊strong{bus}, a collection of wires that carry multiple bits.

◊img[#:src "/images/or16.svg" #:style "width: auto"]{}

◊img[#:src "/images/16-bit-bus.svg"]{}

◊; By the end of this tutorial, you'll understand how to declare buses, access individual bits, connect groups of bits, create internal buses, and build multi-bit chips using HDL.
}

◊hr{}

◊slide{
◊h2{Reading HDL Bus Syntax}
Notice the following declarations:
- ◊code{a[16]} declares a bus containing 16 input bits.
- ◊code{b[16]} declares another 16-bit bus.
- ◊code{out[16]} declares a 16-bit output bus.
Notice that ◊code{a[16]} means a bus containing 16 bits, ◊strong{not} the sixteenth bit of the input ◊code{a}.
◊hdl-code-block{
CHIP Or16 {
    IN a[16], b[16];
    OUT out[16];

    PARTS:
    //// Replace this comment with your code.
}
}
That's because the meaning of the brackets ◊strong{depends on where} they're used. 
If used in ◊strong{IN} and ◊strong{OUT}, it defines the width of the bus. 
If used in ◊strong{PARTS:} it refers to ◊strong{selecting} individual bits from the bus.
}

◊slide{
◊h2{Selecting Individual Bits from a Bus}
◊hdl-code-block{
CHIP IsOdd {
    IN in[8];
    OUT out;

    PARTS:
    Or(a=in[0], b=false, out=out);
}   
}
}

◊ul{
◊li{◊code{a=in[0]} selects the 1st bit from the ◊code{in} bus, and passes it to the ◊code{a} input of the ◊code{Or} gate. }
◊li{◊code{b=false} which sets all input bits of ◊code{b} to ◊code{0}.}
}

◊slide{
◊h2{Selecting a single bit from a bus}

We ◊strong{read} binary numbers from left to right (→), but HDL ◊strong{indexes} bits from right to left (←), starting at bit 0.

This is ◊strong{opposite} to arrays in languages like Python, JavaScript, and C, where index 0 refers to the ◊strong{leftmost} element.
◊img[#:src "/images/multibit-indexing.svg"]{}
}

◊hr{}

◊slide{
◊h2{A Note on Loops in HDL}
◊strong{There are none!}
In the coming section, You'll see statements like:
◊pre{For i=0..15}
But ◊strong{remember}, our teaching HDL(hardware description language) ◊strong{does not} support for loops, so you'll have to just write them out manually(or copy paste). You only have the previous gates you built and the indexing syntax to rely on.

Now that you've learned how to index a single bit in a bus, you can now build Not16, And16, Or16, Mux16, Or8Way. The projects are provided below. ◊strong{Do not} do ◊stong{Multi-Way} gates just yet until you've learned how to sub-bus(sub indexing).
}

◊hr{}

◊slide{
◊h2{Project: Not16, And16, Or16, Mux16, Or8Way} 

◊h3{Multi-Bit Not}
◊p{An n-bit Not gate applies the Boolean operation Not to every one of the bits in its n-bit input bus:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Not16
  ◊strong{Inputs:} in[16] // a 16-bit pin
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} For i=0..15 out[i]=Not(in[i]).
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Not
  }
}
◊(table 
    (table-headings (list "in" "out"))
(table-entries 
(list "0000000000000000" "1111111111111111")
(list "1111111111111111" "0000000000000000")
(list "1010101010101010" "0101010101010101")
(list "0011110011000011" "1100001100111100")
(list "0001001000110100" "1110110111001011")
) #:caption (list "Not16"))

◊hr{}

◊h3{Multi-Bit And}
◊p{An n-bit And gate applies the Boolean operation And to every one of the n bit-pairs arrayed in its two n-bit input buses:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} And16
  ◊strong{Inputs:} a[16], b[16]
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} For i=0..15 out[i]=And(a[i],b[i]).
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: And
  }
}
◊(table 
    (table-headings (list "a" "b" "out"))
(table-entries 
(list "0000000000000000" "0000000000000000" "0000000000000000")
(list "0000000000000000" "1111111111111111" "0000000000000000")
(list "1111111111111111" "1111111111111111" "1111111111111111")
(list "1010101010101010" "0101010101010101" "0000000000000000")
(list "0011110011000011" "0000111111110000" "0000110011000000")
(list "0001001000110100" "1001100001110110" "0001000000110100")
) #:caption (list "And16"))

◊hr{}

◊h3{Multi-Bit Or}
◊p{An n-bit Or gate applies the Boolean operation Or to every one of the n bit-pairs arrayed in its two n-bit input buses:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Or16
  ◊strong{Inputs:} a[16], b[16]
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} For i=0..15 out[i]=Or(a[i],b[i]).
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Or
  }
}
◊(table 
    (table-headings (list "a" "b" "out"))
(table-entries 
(list "0000000000000000" "0000000000000000" "0000000000000000")
(list "0000000000000000" "1111111111111111" "1111111111111111")
(list "1111111111111111" "1111111111111111" "1111111111111111")
(list "1010101010101010" "0101010101010101" "1111111111111111")
(list "0011110011000011" "0000111111110000" "0011111111110011")
(list "0001001000110100" "1001100001110110" "1001101001110110")
) #:caption (list "Or16"))

◊hr{}

◊h3{Multi-Bit Multiplexor}
◊p{An n-bit multiplexor is exactly the same as the binary multiplexor described in figure 1.8, except that the two inputs are each n-bit wide; the selector is a single bit.}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Mux16
  ◊strong{Inputs:} a[16], b[16], sel
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} If sel=0 then for i=0..15 out[i]=a[i] 
  else for i=0..15 out[i]=b[i].
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Mux
  }
}
◊(table 
    (table-headings (list "a" "b" "sel" "out"))
(table-entries 
(list "0000000000000000" "0000000000000000" "0" "0000000000000000")
(list "0000000000000000" "0000000000000000" "1" "0000000000000000")
(list "0000000000000000" "0001001000110100" "0" "0000000000000000")
(list "0000000000000000" "0001001000110100" "1" "0001001000110100")
(list "1001100001110110" "0000000000000000" "0" "1001100001110110")
(list "1001100001110110" "0000000000000000" "1" "0000000000000000")
(list "1010101010101010" "0101010101010101" "0" "1010101010101010")
(list "1010101010101010" "0101010101010101" "1" "0101010101010101")
) #:caption (list "Mux16"))

◊hr{}

◊h3{Multi-Way Or}
◊p{An n-way Or gate outputs 1 when at least one of its n bit inputs is 1, and 0 otherwise. Here is the 8-way variant of this gate:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Or8Way
  ◊strong{Inputs:} in[8]
  ◊strong{Outputs:} out
  ◊strong{Function:} out=Or(in[0],in[1],...,in[7]).
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Or
  }
}
◊(table 
    (table-headings (list "in" "out"))
(table-entries 
(list "00000000" "0")
(list "11111111" "1")
(list "00010000" "1")
(list "00000001" "1")
(list "00100110" "1")
) #:caption (list "Or8Way"))

}

◊hr{}

◊slide{
◊h2{Selecting a range of bits from a bus}
◊img[#:src "/images/multibit-indexing-ranged.svg"]{}
}

◊; Or16 and And16 are parallel implementation of Or and And
◊; MultiwayOr relies on "cascading" adjacent bits
◊; mention temporary variables/internal pins will be used a lot

◊; slide{◊img[#:src "/images/16-bit-select-1.svg"]{}}
◊; slide{◊img[#:src "/images/16-bit-select-4.svg"]{}}

◊hr{}

◊h2{1.2.4 Multi-Way Versions of Basic Gates}
◊p{Many 2-way logic gates that accept two inputs have natural generalization to multi-way variants that accept an arbitrary number of inputs. This section describes a set of multi-way gates that will be used subsequently in various chips in our computer architecture. Similar generalizations can be developed for other architectures, as needed.}

◊hr{}

◊h3{Multi-Way/Multi-Bit Multiplexor}
◊p{An m-way n-bit multiplexor selects one of m n-bit input buses and outputs it to a single n-bit output bus. The selection is specified by a set of k control bits, where k=log_{2}m. Figure 1.10 depicts a typical example.}

◊p{The computer platform that we develop in this book requires two variations of this chip: A 4-way 16-bit multiplexor and an 8-way 16-bit multiplexor:}

◊img[#:src "/images/4way-mux.png"]{}
◊div[#:class "api-box"]{
  ◊strong{Chip name:} Mux4Way16
  ◊strong{Inputs:} a[16], b[16], c[16], d[16], sel[2]
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} If sel=00 then out =a else if sel=01 then out =b else if sel=10 then out =c else if sel=11 then out =d
  ◊strong{Comment:} The assignment operations mentioned above are all 16-bit. For example, "out=a" means "for i=0..15 out[i]=a[i]".
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Mux16
  }
}
◊(table 
    (table-headings (list "a" "b" "c" "d" "sel" "out"))
(table-entries 
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "00" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "01" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "10" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "11" "0000000000000000")
(list "0001001000110100" "1001100001110110" "1010101010101010" "0101010101010101" "00" "0001001000110100")
(list "0001001000110100" "1001100001110110" "1010101010101010" "0101010101010101" "01" "1001100001110110")
(list "0001001000110100" "1001100001110110" "1010101010101010" "0101010101010101" "10" "1010101010101010")
(list "0001001000110100" "1001100001110110" "1010101010101010" "0101010101010101" "11" "0101010101010101")
) #:caption (list "Mux4Way16"))

◊hr{}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Mux8Way16
  ◊strong{Inputs:} a[16], b[16], c[16], d[16], e[16], f[16], g[16], h[16], sel[3]
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} If sel=000 then out =a else if sel=001 then out =b else if sel=010 out =c ... else if sel=111 then out =h
  ◊strong{Comment:} The assignment operations mentioned above are all 16-bit. For example, "out=a" means "for i=0..15 out[i]=a[i]".
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Mux16
  }
}
◊(table 
    (table-headings (list "a" "b" "c" "d" "e" "f" "g" "h" "sel" "out"))
(table-entries 
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "000" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "001" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "010" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "011" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "100" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "101" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "110" "0000000000000000")
(list "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "0000000000000000" "111" "0000000000000000")
(list "0001001000110100" "0010001101000101" "0011010001010110" "0100010101100111" "0101011001111000" "0110011110001001" "0111100010011010" "1000100110101011" "000" "0001001000110100")
(list "0001001000110100" "0010001101000101" "0011010001010110" "0100010101100111" "0101011001111000" "0110011110001001" "0111100010011010" "1000100110101011" "001" "0010001101000101")
(list "0001001000110100" "0010001101000101" "0011010001010110" "0100010101100111" "0101011001111000" "0110011110001001" "0111100010011010" "1000100110101011" "010" "0011010001010110")
(list "0001001000110100" "0010001101000101" "0011010001010110" "0100010101100111" "0101011001111000" "0110011110001001" "0111100010011010" "1000100110101011" "011" "0100010101100111")
(list "0001001000110100" "0010001101000101" "0011010001010110" "0100010101100111" "0101011001111000" "0110011110001001" "0111100010011010" "1000100110101011" "100" "0101011001111000")
(list "0001001000110100" "0010001101000101" "0011010001010110" "0100010101100111" "0101011001111000" "0110011110001001" "0111100010011010" "1000100110101011" "101" "0110011110001001")
(list "0001001000110100" "0010001101000101" "0011010001010110" "0100010101100111" "0101011001111000" "0110011110001001" "0111100010011010" "1000100110101011" "110" "0111100010011010")
(list "0001001000110100" "0010001101000101" "0011010001010110" "0100010101100111" "0101011001111000" "0110011110001001" "0111100010011010" "1000100110101011" "111" "1000100110101011")
) #:caption (list "Mux8Way16"))

◊hr{}

◊h3{Multi-Way/Multi-Bit Demultiplexor}
◊p{An m-way n-bit demultiplexor (figure 1.11) channels a single n-bit input into one of m possible n-bit outputs. The selection is specified by a set of k control bits, where k=log_{2}m.}

◊p{The specific computer platform that we will build requires two variations of this chip: A 4-way 1-bit demultiplexor and an 8-way 1-bit multiplexor, as follows.}

◊img[#:src "/images/4way-demux.png"]{}
◊div[#:class "api-box"]{
  ◊strong{Chip name:} DMux4Way
  ◊strong{Inputs:} in, sel[2]
  ◊strong{Outputs:} a, b, c, d
  ◊strong{Function:} 
  If sel=00 then {a=in, b=c=d=0} 
  else if sel=01 then {b=in, a=c=d=0} 
  else if sel=10 then {c=in, a=b=d=0} 
  else if sel=11 then {d=in, a=b=c=0}.
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: DMux
  }
}
◊(table 
    (table-headings (list "in" "sel" "a" "b" "c" "d"))
(table-entries 
(list "0" "00" "0" "0" "0" "0")
(list "0" "01" "0" "0" "0" "0")
(list "0" "10" "0" "0" "0" "0")
(list "0" "11" "0" "0" "0" "0")
(list "1" "00" "1" "0" "0" "0")
(list "1" "01" "0" "1" "0" "0")
(list "1" "10" "0" "0" "1" "0")
(list "1" "11" "0" "0" "0" "1")
) #:caption (list "DMux4Way"))

◊hr{}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} DMux8Way
  ◊strong{Inputs:} in, sel[3]
  ◊strong{Outputs:} a, b, c, d, e, f, g, h
  ◊strong{Function:} 
  If sel=000 then {a=in, b=c=d=e=f=g=h=0} 
  else if sel=001 then {b=in, a=c=d=e=f=g=h=0} 
  else if sel=010 ...
  ...
  else if sel=111 then {h=in, a=b=c=d=e=f=g=0}.
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: DMux, DMux4Way
  }
}
◊(table 
    (table-headings (list "in" "sel" "a" "b" "c" "d" "e" "f" "g" "h"))
(table-entries 
(list "0" "000" "0" "0" "0" "0" "0" "0" "0" "0")
(list "0" "001" "0" "0" "0" "0" "0" "0" "0" "0")
(list "0" "010" "0" "0" "0" "0" "0" "0" "0" "0")
(list "0" "011" "0" "0" "0" "0" "0" "0" "0" "0")
(list "0" "100" "0" "0" "0" "0" "0" "0" "0" "0")
(list "0" "101" "0" "0" "0" "0" "0" "0" "0" "0")
(list "0" "110" "0" "0" "0" "0" "0" "0" "0" "0")
(list "0" "111" "0" "0" "0" "0" "0" "0" "0" "0")
(list "1" "000" "1" "0" "0" "0" "0" "0" "0" "0")
(list "1" "001" "0" "1" "0" "0" "0" "0" "0" "0")
(list "1" "010" "0" "0" "1" "0" "0" "0" "0" "0")
(list "1" "011" "0" "0" "0" "1" "0" "0" "0" "0")
(list "1" "100" "0" "0" "0" "0" "1" "0" "0" "0")
(list "1" "101" "0" "0" "0" "0" "0" "1" "0" "0")
(list "1" "110" "0" "0" "0" "0" "0" "0" "1" "0")
(list "1" "111" "0" "0" "0" "0" "0" "0" "0" "1")
) #:caption (list "DMux8Way"))

◊hr{}

◊ul{
  ◊li{◊strong{Multi-Bit Not/And/Or Gates:} Since we already know how to implement the elementary versions of these gates, the implementation of their n-ary versions is simply a matter of constructing arrays of n elementary gates, having each gate operate separately on its bit inputs. This implementation task is ◊strong{rather boring}, but it will carry its weight when these multi-bit gates are used in more complex chips, as described in subsequent chapters.}
  ◊li{◊strong{Multi-Bit Multiplexor:} The implementation of an n-ary multiplexor is simply a matter of feeding the same selection bit to every one of n binary multiplexors. Again, a boring task resulting in a very useful chip.}
  ◊li{◊strong{Multi-Way Gates:} Implementation tip: Think forks. Break the problem into smaller choices. How can you use gates that select between two inputs to build a gate that selects between four or more?}
}