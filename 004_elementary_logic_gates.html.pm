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
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    This gate is primitive; no implementation needed.
  }
}

◊hr{}

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
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Nand
  }
}

◊hr{}

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
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Nand, Not
  }
}

◊hr{}

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
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Nand
  }
}

◊hr{}

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
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Not, And, Or
  }
}

◊hr{}

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
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Not, And, Or
  }
}

◊hr{}

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
◊p{A demultiplexor (figure 1.9) performs the opposite function of a multiplexor: It takes a single input and channels it to one of two ◊strong{POSSIBLE} outputs according to a selector bit that specifies which output to chose.}

◊div[#:class "api-box"]{
  ◊strong{Chip name:} DMux
  ◊strong{Inputs:} in, sel
  ◊strong{Outputs:} a, b
  ◊strong{Function:} If sel=0 then {a=in, b=0} else {a=0, b=in}.
  ◊details{
    ◊summary[#:style "color: red;"]{SPOILERS}
    One ◊strong{POSSIBLE} implementation uses: Not, And
  }
}

◊h2{1.3 Implementation}
◊p{Similar to the role of axioms in mathematics, primitive gates provide a set of elementary building blocks from which everything else can be built. Operationally, primitive gates have an "off-the-shelf" implementation that is supplied externally. Thus, they can be used in the construction of other gates and chips without worrying about their internal design. In the computer architecture that we are now beginning to build, we have chosen to base all the hardware on one primitive gate only: Nand.}

◊p{We now turn to outlining the first stage of this bottom-up hardware construction project, one gate at a time. Our implementation guidelines are intentionally partial, since we want you to discover the actual gate architectures yourself. We reiterate that each gate can be implemented in more than one way; the simpler the implementation, the better.}

◊ul{
  ◊li{◊strong{Not:} The implementation of a unary Not gate from a binary Nand gate is simple. Tip: Think positive.}
  ◊li{◊strong{And:} Once again, the gate implementation is simple. Tip: Think negative.}
  ◊li{◊strong{Or/Xor:} These functions can be defined in terms of some of the Boolean functions implemented previously, using some simple Boolean manipulations. Thus, the respective gates can be built using previously built gates.}
  ◊li{◊strong{Multiplexor/Demultiplexor:} Likewise, these gates can be built using previously built gates.}
}