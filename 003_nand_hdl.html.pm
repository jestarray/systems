#lang pollen

◊h1{NAND theorem}

◊(yt "RQzmQvi1tdU")

◊slide{
◊h2{The NAND Gate}
◊(table 
    (table-headings (list "A" "B" "OUT"))
(table-entries 
(list "0" "0" "1")
(list "0" "1" "1")
(list "1" "0" "1")
(list "1" "1" "0")
) #:caption (list "NAND" ◊img[#:src "/images/nand_gate.svg"]{}))
}
Above is the ◊strong{NAND} gate(aka ◊strong{NOT AND}), which outputs ◊code{0} ◊strong{if and only if} both inputs are ◊code{1}, and outputs ◊code{1} otherwise. It looks like an ◊strong{AND} gate, just with a ◊strong{bubble} at the end, which represents the ◊strong{NOT} operation.

◊slide{
◊h2{Building the NAND Gate}
◊img[#:src "/images/relay.gif"]{}
◊lead{◊a[#:href "http://nandgame.com/"]{Let's build the NAND gate!}}
}
We can build a ◊strong{NAND} gate by cleverly arranging Relays. Relay's have a wire wrapped around an magnetic rod. When electricity runs through the coil, it creates a magnetic field that can pull down a lever which then outputs electricity depending.

◊slide{
◊h2{The Universal Gate}
The ◊strong{NAND} is also known as the ◊em{"universal gate"}, meaning it can be used to build all the other gates, like ◊em{AND, NOT, OR, etc}.
}

◊slide{
◊h3{Elementary Logic Gates}
◊ol{
    ◊li{Not}
    ◊li{And}
    ◊li{Or}
    ◊li{Xor}
    ◊li{Mux(hardest), aka selector in nandgame}
    ◊li{DMux(hardest), aka switch in nandgame}
}

◊h3{16-bit variants}
◊strong{NOTE: }◊em{nandgame does not have these but it's easy to do in HDL}
◊ol{
    ◊li{Not16}
    ◊li{And16}
    ◊li{Or16}
    ◊li{Mux16}
}

◊h3{Multiway Variants}
◊strong{NOTE: } ◊em{nandgame does not have these}
◊ol{
    ◊li{Or8Way}
    ◊li{Mux4Way16}
    ◊li{Mux8Way16}
    ◊li{DMux4Way}
    ◊li{DMux8Way}
}
}

Your task is to build all of these gates ◊strong{starting only from a} ◊em{NAND gate}. Once you've successfully built a gate, you may use it as a building block for the gates that follow.

For example:

First, build the ◊em{Not} gate using only NAND gates.
After that, you may use both ◊em{NAND} and ◊em{Not} gates to build the ◊em{And} gate.
Continue this process for the remaining gates.

It is highly recommended to follow the order listed above, since the gates become progressively more challenging as you move down the list.

◊slide{
◊h2{Resources}
◊lead{◊a[#:href "https://www.nandgame.com/"]{Nand Game} (drag and drop gates)}
◊lead{◊a[#:href "https://nand2tetris.github.io/web-ide/chip/"]{Nand2Tetris Web IDE} (text based chip diagrams)}
◊lead{◊a[#:href "https://circuitverse.org/simulator"]{Circuitverse} (alternative diagraming)}
I recommend you ◊strong{first} use the visual NAND game, since the UI is more intuitive, and then transcribe what you did to HDL using the online web IDE.

◊lead{◊a[#:href "/media/project-1.pdf"]{Chip truth tables and specs} (pages 19 to 28)}
◊; explain the test script, compare file, etc
◊object[#:data "/images/diagram_to_hdl.svg" #:type "image/svg+xml"]{}
}

◊slide{
◊h2{HDL}
HDL also known as ◊em{Hardware Description Language} is what real chip designers use and we have stripped it down to its bare bones to make it easier to learn.

It is ◊strong{NOT} a programming language in the typical sense.
◊ul{
    ◊li{No loops}
    ◊li{No conditionals(if else)}
    ◊li{No Functions}
}
You just plug in variables to outputs.
It is ◊strong{case sensitive}, mandatory semicolons, commands, becareful of typos!
}

◊; internal pins
