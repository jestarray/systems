#lang pollen
◊h1{ALU}

The ALU is the chip responsible for doing all the math that happens in the CPU. The chips you have to implement are:
◊ul{
    ◊li{HalfAdder - designed to add two bits}
    ◊li{FullAdder - designed to add three bits}
    ◊li{Add16 - designed to add two 16 bit numbers}
    ◊li{Inc16 - adds the constant 1 to a given numer}
    ◊li{ALU - the arithmetic logic unit, responsible for math operations}
}
Vist this PDF for more hints and details: ◊a[#:href "https://b1391bd6-da3d-477d-8c01-38cdf774495a.filesusr.com/ugd/44046b_89c60703ebfc4bf39acef13bdc050f5d.pdf" #:target "_blank"]{Download}

I'll cover the ALU specifically because its the most complex one of in this section. 

◊img[#:src "/images/hack_alu.png"]

◊ul{
    ◊li{Chip name: ALU}
    ◊ul{
    ◊li{Inputs:}
    ◊ul{
    ◊li{x[16], y[16], // Two 16-bit data inputs}
    ◊li{zx, // Zero the x input}
    ◊li{nx, // Negate the x input}
    ◊li{zy, // Zero the y input}
    ◊li{ny, // Negate the y input}
    ◊li{f, // Function code: 1 for Add, 0 for And}
    ◊li{no // Negate the out output}
    }}
    ◊ul{
    ◊li{Outputs:}
    ◊ul{
    ◊li{out[16], // 16-bit output}
    ◊li{zr, // True iff out=0}
    ◊li{ng // True iff out<0}}
    }
    ◊ul{
        ◊li{Function:}
        ◊ul{
    ◊li{if zx then x = 0 // 16-bit zero constant}
    ◊li{if nx then x = !x // Bit-wise negation}
    ◊li{if zy then y = 0 // 16-bit zero constant}
    ◊li{if ny then y = !y // Bit-wise negation}
    ◊li{if f then out = x + y // Integer 2's complement addition
        else out = x & y // Bit-wise And}
    ◊li{if no then out = !out // Bit-wise negation}
    ◊li{if out=0 then zr = 1 else zr = 0 // 16-bit eq. comparison}
    ◊li{if out<0 then ng = 1 else ng = 0 // 16-bit neg. comparison}
        }
    }
}

Function:

◊(table #:style '((width "100%;") (style "text-align: center;")) 
◊(table-headings
(list "zx"	"nx" "zy" "ny" "f" "no" "out") #:style '((style "text-align:inherit;"))) 
◊(table-entries
(list "if zx then x=0" "if nx then x=!x" "if zy then y=0" "if ny then y=!y" "if f then out=x+y else out=x&y" "if no then out=!out" "f(x,y)=")
(list 1	1 1 0 1 0 -1)
(list 0	0 1 1 0 0 "x")
(list 1	1 0 0 0 0 "y")
(list 0	0 1 1 0 1 "!x")
(list 1	1 0 0 0 1 "!y")
(list 0	0 1 1 1 1 "-x")
(list 1	1 0 0 1 1 "-y")
(list 0	1 1 1 1 1 "x+1")
(list 1	1 0 1 1 1 "y+1")
(list 0	0 1 1 1 0 "x-1")
(list 1	1 0 0 1 0 "y-1")
(list 0	0 0 0 1 0 "x+y")
(list 0	1 0 0 1 1 "x-y")
(list 0	0 0 1 1 1 "y-x")
(list 0	0 0 0 0 0 "x&y")
(list 0	1 0 1 0 1 "x|y")
))

There are 6 control bits being:
◊pre{zx, nx, zy, ny, f, no}
Each row corresponds to a series of transformation on the x and y input that constitute and build up to an overall function noted in the out column. 

Let's elaborate any row with any input, and let's start with the row that adds 1 to the x input.

◊steps{
    ◊step{
x + 1 
◊(table (table-headings (list "zx"	"nx" "zy" "ny" "f" "no" "out") #:style '((style "text-align:inherit;")))
(table-entries 
(list 0	1 1 1 1 1 "x+1")
) #:caption "increment x by 1")
Following the table from left to right(~>) sequentially,

Say the inputs are:
x: 0111 (7)
y: 1011 (doesn't really matter since we only want to increment x by 1 here.)

◊b{zx} is 0, so we don't do anything 
◊b{nx} is 1, so !x => 1000
◊b{zy} is 1, so y = 0000
◊b{ny} is 1 so y = 1111
◊b{f} is 1, so we do 2's complement addition on the transformed inputs:
◊(pre "
  1000
+ 1111 
_________
1[0111]
")
◊b{no} is 1 so we negatate output:
!(0111) = 1000 (8)
and thus we have done x+1
    }
}

◊steps{
    ◊step{
y - x 

◊(table (table-headings (list "zx"	"nx" "zy" "ny" "f" "no" "out") #:style '((style "text-align:inherit;")))
(table-entries 
(list 0	0 0 1 1 1 "y-x")
) #:caption "subtracts the input Y by the input X")

Let's say our inputs are:
x: 0100 (4)
y: 1001 (9)

We're trying to do 9-4 = 5. Let's see if we achieve this:
◊b{zx} is 0, so we don't do anything 
◊b{nx} is 0, so we don't do anything
◊b{zy} is 0, so we don't do anything
◊b{ny} is 1, so we negate !y = 0110
◊b{f} is 1, so we do 2's complement addition on the transformed inputs:
◊(pre "
  0100 
+ 0110 
_________
  1010
") ◊b{no} is 1 so we negatate out above which will be 0101(5)!
9 - 4 = 5 , so we are good
    }
}

Try it yourself! Elaborate any row with random inputs you can come up with.