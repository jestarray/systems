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
◊h3{◊a[#:href "http://nandgame.com/"]{Let's build the NAND gate!}}
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
◊ol{
    ◊li{Or8Way}
    ◊li{Mux4Way16}
    ◊li{Mux8Way16}
    ◊li{DMux4Way}
    ◊li{DMux8Way}
}
}

So, you are tasked to start off with a NAND gate, and work your way up to build other gates, and when you have built those other gates, ◊strong{you can use those gates} you built ◊strong{to build other gates}. It's recommended you do it in the order above because the difficulty increases as you go down the list.

◊slide{
◊h2{Resources}
◊h3{◊a[#:href "https://www.nandgame.com/"]{Nand Game} (drag and drop gates)}
◊h3{◊a[#:href "https://nand2tetris.github.io/web-ide/chip/"]{Nand2Tetris Web IDE} (text based chip diagrams)}
I recommend you ◊strong{first} use the visual NAND game, since the UI is more intuitive, and then transcribe what you did to HDL using the online web IDE.

◊h3{◊a[#:href "/media/project-1.pdf"]{Chip truth tables and specs} (pages 19 to 28)}
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
