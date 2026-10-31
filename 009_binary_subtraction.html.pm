#lang pollen
◊h1{Binary Subtraction}

◊h2{How to subtract binary numbers?}

◊pre{x + y = x + -y}

Subtraction is just addition with negative numbers! To put it shortly, if you already know how to add two binary numbers, you know how to subtract.
In decimal for example:
◊pre{
6 - 4 = 6 + -4
2 = 2
}

Now let's do this in binary.

◊(img-row "/images/bin-1.svg" "/images/bin-2.svg" "/images/bin-3.svg" "/images/bin-4.svg" "/images/bin-5.svg")

◊steps{
◊step{Subtracting via adding negative binary numbers. Just do binary addition and it will work out. Throw away the extra carry overflow
◊(layout-spread-row
◊(deci->bin-table 6 4 #:caption "6") ◊(deci->bin-table -4 4 #:caption "-4")
)
◊(pre "
  1 1
  [ 0 1 1 0 ] (6)
+ [ 1 1 0 0 ] (-4)
_______________
1 [ 0 0 1 0 ] (2)
^ overflow
")
the overflow is ignored because it can't fit inside the bit width.
◊(deci->bin-table 2 4 #:caption "2 in binary (signed)")
Due to tossing away the overflow, we get ◊(base 2 10), which is the answer to our subtraction problem in decimal: 6 + -4 = 2
}
}

◊(layout-spread-row
◊(max-signed-limit-table 4)
)

◊more-examples{
◊(pre "
Example: -8 + 3 = -5

  [ 1 0 0 0 ] (-8)
+ [ 0 0 1 1 ] (3)
_______________
[ 1 0 1 1 ] (-5)


Example: -6 + -1 = -7

  1 1 1
  [ 1 0 1 0 ] (-6)
+ [ 1 1 1 1 ] (-1)
_______________
1 [ 1 0 0 1 ] (-7)
")
}

◊lead{Check your understanding!}
◊(q "Convert these numbers to binary and add them: -5 + 4"
◊(pre "
  [ 1 0 1 1 ] (-5)
+ [ 0 1 0 0 ] (4)
_______________
[ 1 1 1 1 ] (-1)
"))
◊(q "Convert these numbers to binary and add them: 7 + -7"
◊(pre "
  1 1 1 1
  [ 0 1 1 1 ] (7)
+ [ 1 0 0 1 ] (-7)
_______________
1 [ 0 0 0 0 ] (0)
")
)
◊(q "Convert these numbers to binary and add them: -8 + -8"
"We have to up to a 5 bit or more system because -8 + -8 = -16, which does not fit into a 4 bits"
◊(deci->bin-table -8 5 #:caption "-8 in 5bit binary")
◊(pre "
  1 1
  [ 1 1 0 0 0 ] (-8)
+ [ 1 1 0 0 0 ] (-8)
_______________
1 [ 1 0 0 0 0 ] (-16)
")
)

Fun Fact: New hardware is not required for subtraction, we just re-use what we do in addition!

◊a[#:href "https://jest-systems.netlify.app/#binary_subtraction(two's_complement)"]{More Signed Binary Subtraction problems with variable bitwidth}

◊h2{Overflow Problems}

There are a few problems with ◊b{signed} arithmetic. 

◊h3{Positive overflow}
Positive + Positive = Negative
Adding two positive numbers can result in a negative value
◊(pre "
  0110 (6)
+ 0011 (3)
___________
  1001 (-7)
")
◊h3{Negative overflow}
Negative + Negative = Positive
Adding two negative numbers will result in a positive
◊(pre "
 1 11 
  1011 (-5)
+ 1011 (-5)
________
  0110 (6)
")

If you're adding two signed numbers of opposite sign, e.g positive + negative, you will never overflow


◊a[#:href "https://jest-systems.netlify.app/#binary_subtraction(two's_complement)"]{More Signed Overflow Problems}