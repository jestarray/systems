#lang pollen

◊h1{Elementary Logic Gates}

◊h2{1.2.1 The Nand Gate}

◊layout-spread-row{
◊(table 
    (table-headings (list "A" "B" "OUT"))
(table-entries 
(list "0" "0" "1")
(list "0" "1" "1")
(list "1" "0" "1")
(list "1" "1" "0")
) #:caption (list "NAND"))
◊img[#:src "/images/nand_gate.svg"]{}
}
◊p{The starting point of our computer architecture is the Nand gate, from which all other gates and chips are built. The Nand gate is designed to compute the following Boolean function:}

◊p{Throughout the book, we use "chip API boxes" to specify chips. For each chip, the API specifies the chip name, the names of its input and output pins, the function or operation that the chip effects, and an optional comment.}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Nand
  ◊strong{Inputs:} a, b
  ◊strong{Outputs:} out
  ◊strong{Function:} If a=b=1 then out =0 else out =1
  ◊strong{Comment:} This gate is considered primitive and thus there is no need to implement it.
}

◊h2{1.2.2 Basic Logic Gates}
◊p{Some of the logic gates presented here are typically referred to as "elementary" or "basic." At the same time, every one of them can be composed from Nand gates alone. Therefore, they need not be viewed as primitive.}

◊h3{Not}
◊layout-spread-row{
◊(table 
    (table-headings (list "INPUT" "OUTPUT"))
(table-entries 
(list "0" "1")
(list "1" "0")
) #:caption (list "NOT(!)"))
◊img[#:src "images/not_gate.svg"]{}
}
◊p{The single-input Not gate, also known as "converter," converts its input from 0 to 1 and vice versa. The gate API is as follows:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Not
  ◊strong{Inputs:} in
  ◊strong{Outputs:} out
  ◊strong{Function:} If in=0 then out =1 else out =0.
}

◊h3{And}
◊layout-spread-row{
◊(table 
    (table-headings (list "A" "B" "OUTPUT"))
(table-entries 
(list "0" "0" "0")
(list "0" "1" "0")
(list "1" "0" "0")
(list "1" "1" "1")
) #:caption (list "AND(*)"))
◊img[#:src "/images/and_gate.svg"]{}
}
◊p{The And function returns 1 when both its inputs are 1, and 0 otherwise.}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} And
  ◊strong{Inputs:} a, b
  ◊strong{Outputs:} out
  ◊strong{Function:} If a=b=1 then out =1 else out =0.
}

◊h3{Or}
◊layout-spread-row{
◊(table 
    (table-headings (list "A" "B" "OUTPUT"))
(table-entries 
(list "0" "0" "0")
(list "0" "1" "1")
(list "1" "0" "1")
(list "1" "1" "1")
) #:caption (list "OR(+)"))
◊img[#:src "/images/or_gate.svg"]{}
}

◊p{The Or function returns 1 when at least one of its inputs is 1, and 0 otherwise.}
◊div[#:class "api-box"]{
  ◊strong{Chip name:} Or
  ◊strong{Inputs:} a, b
  ◊strong{Outputs:} out
  ◊strong{Function:} If a=b=0 then out =0 else out =1.
}

◊h3{Xor}
◊layout-spread-row{
◊(table 
    (table-headings (list "A" "B" "OUTPUT"))
(table-entries 
(list "0" "0" "0")
(list "0" "1" "1")
(list "1" "0" "1")
(list "1" "1" "0")
) #:caption (list "XOR"))
◊img[#:src "/images/xor_gate.svg"]{}
}
◊p{The Xor function, also known as "exclusive or," returns 1 when its two inputs have opposing values, and 0 otherwise.}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Xor
  ◊strong{Inputs:} a, b
  ◊strong{Outputs:} out
  ◊strong{Function:} If a ≠ b then out =1 else out =0.
}

◊h3{Multiplexor}
◊layout-spread-row{
◊(table 
    (table-headings (list "A" "B" "SEL" "OUT"))
(table-entries
(list "0" "0" "0" "0")
(list "0" "0" "1" "0")
(list "0" "1" "0" "0")
(list "0" "1" "1" "1")
(list "1" "0" "0" "1")
(list "1" "0" "1" "0")
(list "1" "1" "0" "1")
(list "1" "1" "1" "1")
) #:caption (list "MUX"))
◊img[#:src "/images/multiplexor_gate.svg"]{}
}
◊(table 
(table-headings (list "SEL" "OUT"))
(table-entries 
(list "0" "a")
(list "1" "b")) #:caption (list "MUX"))
◊p{A multiplexor (figure 1.8) is a three-input gate that uses one of the inputs, called "selection bit," to select and output one of the other two inputs, called "data bits." Thus, a better name for this device might have been selector. The name multiplexor was adopted from communications systems, where similar devices are used to serialize (multiplex) several input signals over a single output wire.}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Mux
  ◊strong{Inputs:} a, b, sel
  ◊strong{Outputs:} out
  ◊strong{Function:} If sel =0 then out =a else out =b.
}

◊h3{DeMultiplexor}
◊layout-spread-row{
◊(table 
    (table-headings (list "IN" "SEL"" A" "B"))
(table-entries
(list "0" "0" "0" "0")
(list "0" "1" "0" "0")
(list "1" "0" "1" "0")
(list "1" "1" "0" "1")
) #:caption (list "DEMUX"))
◊img[#:src "/images/demultiplexor.svg"]{}
}
◊(table 
(table-headings (list "SEL" "A" "B"))
(table-entries 
(list "0" "IN" "0")
(list "1" "0" "IN")) #:caption (list "DEMUX"))
◊p{A demultiplexor (figure 1.9) performs the opposite function of a multiplexor: It takes a single input and channels it to one of two possible outputs according to a selector bit that specifies which output to chose.}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} DMux
  ◊strong{Inputs:} in, sel
  ◊strong{Outputs:} a, b
  ◊strong{Function:} If sel=0 then {a=in, b=0} else {a=0, b=in}.
}

◊h2{1.2.3 Multi-Bit Versions of Basic Gates}
◊p{Computer hardware is typically designed to operate on multi-bit arrays called "buses." For example, a basic requirement of a 32-bit computer is to be able to compute (bit-wise) an And function on two given 32-bit buses. To implement this operation, we can build an array of 32 binary And gates, each operating separately on a pair of bits. In order to enclose all this logic in one package, we can encapsulate the gates array in a single chip interface consisting of two 32-bit input buses and one 32-bit output bus.}

◊p{This section describes a typical set of such multi-bit logic gates, as needed for the construction of a typical 16-bit computer. We note in passing that the architecture of n-bit logic gates is basically the same irrespective of n's value. When referring to individual bits in a bus, it is common to use an array syntax. For example, to refer to individual bits in a 16-bit bus named data, we use the notation data[0], data[1], data[15].}

◊h3{Multi-Bit Not}
◊p{An n-bit Not gate applies the Boolean operation Not to every one of the bits in its n-bit input bus:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Not16
  ◊strong{Inputs:} in[16] // a 16-bit pin
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} For i=0..15 out[i]=Not(in[i]).
}

◊h3{Multi-Bit And}
◊p{An n-bit And gate applies the Boolean operation And to every one of the n bit-pairs arrayed in its two n-bit input buses:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} And16
  ◊strong{Inputs:} a[16], b[16]
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} For i=0..15 out[i]=And(a[i],b[i]).
}

◊h3{Multi-Bit Or}
◊p{An n-bit Or gate applies the Boolean operation Or to every one of the n bit-pairs arrayed in its two n-bit input buses:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Or16
  ◊strong{Inputs:} a[16], b[16]
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} For i=0..15 out[i]=Or(a[i],b[i]).
}

◊h3{Multi-Bit Multiplexor}
◊p{An n-bit multiplexor is exactly the same as the binary multiplexor described in figure 1.8, except that the two inputs are each n-bit wide; the selector is a single bit.}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Mux16
  ◊strong{Inputs:} a[16], b[16], sel
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} If sel=0 then for i=0..15 out[i]=a[i] 
  else for i=0..15 out[i]=b[i].
}

◊h2{1.2.4 Multi-Way Versions of Basic Gates}
◊p{Many 2-way logic gates that accept two inputs have natural generalization to multi-way variants that accept an arbitrary number of inputs. This section describes a set of multi-way gates that will be used subsequently in various chips in our computer architecture. Similar generalizations can be developed for other architectures, as needed.}

◊h3{Multi-Way Or}
◊p{An n-way Or gate outputs 1 when at least one of its n bit inputs is 1, and 0 otherwise. Here is the 8-way variant of this gate:}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Or8Way
  ◊strong{Inputs:} in[8]
  ◊strong{Outputs:} out
  ◊strong{Function:} out=Or(in[0],in[1],...,in[7]).
}

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
}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} Mux8Way16
  ◊strong{Inputs:} a[16], b[16], c[16], d[16], e[16], f[16], g[16], h[16], sel[3]
  ◊strong{Outputs:} out[16]
  ◊strong{Function:} If sel=000 then out =a else if sel=001 then out =b else if sel=010 out =c ... else if sel=111 then out =h
  ◊strong{Comment:} The assignment operations mentioned above are all 16-bit. For example, "out=a" means "for i=0..15 out[i]=a[i]".
}

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
}

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
}

◊h2{1.3 Implementation}
◊p{Similar to the role of axioms in mathematics, primitive gates provide a set of elementary building blocks from which everything else can be built. Operationally, primitive gates have an "off-the-shelf" implementation that is supplied externally. Thus, they can be used in the construction of other gates and chips without worrying about their internal design. In the computer architecture that we are now beginning to build, we have chosen to base all the hardware on one primitive gate only: Nand.}

◊p{We now turn to outlining the first stage of this bottom-up hardware construction project, one gate at a time. Our implementation guidelines are intentionally partial, since we want you to discover the actual gate architectures yourself. We reiterate that each gate can be implemented in more than one way; the simpler the implementation, the better.}

◊ul{
  ◊li{◊strong{Not:} The implementation of a unary Not gate from a binary Nand gate is simple. Tip: Think positive.}
  ◊li{◊strong{And:} Once again, the gate implementation is simple. Tip: Think negative.}
  ◊li{◊strong{Or/Xor:} These functions can be defined in terms of some of the Boolean functions implemented previously, using some simple Boolean manipulations. Thus, the respective gates can be built using previously built gates.}
  ◊li{◊strong{Multiplexor/Demultiplexor:} Likewise, these gates can be built using previously built gates.}
  ◊li{◊strong{Multi-Bit Not/And/Or Gates:} Since we already know how to implement the elementary versions of these gates, the implementation of their n-ary versions is simply a matter of constructing arrays of n elementary gates, having each gate operate separately on its bit inputs. This implementation task is ◊strong{rather boring}, but it will carry its weight when these multi-bit gates are used in more complex chips, as described in subsequent chapters.}
  ◊li{◊strong{Multi-Bit Multiplexor:} The implementation of an n-ary multiplexor is simply a matter of feeding the same selection bit to every one of n binary multiplexors. Again, a boring task resulting in a very useful chip.}
  ◊li{◊strong{Multi-Way Gates:} Implementation tip: Think forks.}
}