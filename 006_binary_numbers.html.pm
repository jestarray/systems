#lang pollen
◊(require txexpr)

◊(define (deci->div-table e #:caption [caption #f])
    (table #:caption caption #:headings (list "Division" "Quotient" "Remainder")
        #:rows e))

◊(yt "bFLB4dyNKUk")

◊h1{Binary Numbers}

◊slide{
◊h2{Base 10}
◊object[#:data "/images/decimal_yellow_lock.svg" #:type "image/svg+xml"]{}

Humans typically use a ◊strong{base-10 (decimal) number system}, likely developed because we have 10 fingers.

Click any wheel on this lock to advance just that digit. To count upward by 1, we rotate the rightmost wheel forward by one digit. But what happens when we reach 9 and want to add another 1?

We've run out of digits! The rightmost wheel rolls back to 0. To keep counting, we must also advance the wheel to its left by 1: try clicking those two wheels to go from ◊strong{09 to 10}.

But notice something interesting: ◊strong{the position of each digit determines its value}.

Each position has a weight of ◊strong{◊(x^n 10 "n")}, where n starts at 0 for the rightmost position and increases as we move left.

For our four-wheel lock, the weights from left to right are:

◊code{1000, 100, 10, 1}

To find the value of a number, multiply each digit by its position's weight and add the results.

For example, ◊strong{6274} means:

◊code{(6 × 1000) + (2 × 100) + (7 × 10) + (4 × 1) = 6274}

This is how our base-10 number system works.
}

◊slide{
◊h2{Base 2}
◊object[#:data "/images/binary_yellow_lock.svg" #:type "image/svg+xml"]{}


But what if we had a lock where each wheel had only ◊strong{two possible digits: 0 and 1}?

We'd start at 0, advance to 1, but then we'd already be out of digits! Click the rightmost wheel again to roll it back to 0, then click the next wheel to advance it to 1, giving us 10.

This is ◊strong{base 2, also known as binary}, the number system computers use.

Both number systems follow the same rules. The big differences being:
◊ul{
    ◊li{we roll over after 1 in binary, whereas we roll over after 9 in decimal.}
    ◊li{the weights of each position are powers of 2 in binary, whereas they are powers of 10 in decimal.}
}
}

Each binary digit is called a ◊strong{bit}. The ◊strong{bit width} is the number of bits in a representation. Our binary lock has four wheels, so it displays four bits.

Compare the position weights in decimal and binary. Positions count from 0 at the rightmost digit:

◊(table #:caption "Decimal and binary position weights"
        #:headings (list "Position" "n" "…" "4" "3" "2" "1" "0")
        #:rows (list
                (list "Decimal" (x^n 10 "n") "…" (x^n 10 4) (x^n 10 3) (x^n 10 2) (x^n 10 1) (x^n 10 0))
                (list "Binary" (2^ "n") "…" (2^ 4) (2^ 3) (2^ 2) (2^ 1) (2^ 0))))

To reduce confusion, we use a small subscript, ◊(base 10 2) to represent binary numbers, and ◊(base 10 10) means ten .

Similar to how locks have a finite amount of combinations, the bit width of a number also determines the amoutn of possible combinations.
Four bits give us ◊(2^ 4) = 16 different patterns. As unsigned numbers, they represent ◊strong{0 through 15}, because zero is one of the 16 values.

◊(max-unsigned-limit-table 4)

To represent 16, we'd need to ◊strong{expand} the bit width from 4 slots to 5 slots.
◊(base 10000 2) = ◊(base 16 10). 
◊(deci->bin-table 16 5)
Five bits give us ◊(2^ 5) = 32 patterns, representing unsigned values from 0 through 31.

◊hr{}

◊h2{How Many Values Can N Bits Represent?}
◊ul{
  ◊li{With ◊strong{n bits}, we can represent ◊strong{◊(2^ "n") unique combinations}.}
  ◊li{For unsigned numbers, these combinations represent values ranging from ◊strong{0 to ◊(2^ "n") − 1}.}
}

◊(hr)
◊h2{How to convert a binary number to a decimal number?}
◊steps{
    ◊(step "Look at where there is a 1" (deci->bin-table 7 4) 
    "Notice there are 1's underneeth the 4,2, and 1 headers")
    ◊(step "Sum up the corresponding power of 2 number" "you can think of it as an on/off switch" (deci->bin-table 7 4)  "0 + 4 + 2 + 1 = 7; thus our answer is 0111 represents 7")}

◊more-examples{
    ◊(deci->bin-table 4 4)
    0 + 4 + 0 + 0 = 4; thus ◊code{0100} represents 4.
    ◊(deci->bin-table 10 4) 8 + 0 + 2 + 0 = 10; thus ◊code{1010} represents 10.}

◊lead{Check your understanding!}
◊(q "What is the binary number 10011 in decimal?" (deci->bin-table 19 5) "16 + 2 + 1 = 19; Answer: 19")

◊(q "What is the binary number 10101 in decimal?" (deci->bin-table 21 5) "16 + 4 + 1 = 21; Answer: 21")

◊(q "What is the binary number 101001 in decimal ?" (deci->bin-table 41 6) "32 + 8 + 1; Answer 41")

◊(hr)
◊(h2 "How to convert a decimal number to a binary number?")

◊h3{Subtraction method}
◊steps{
    ◊step{
Find the biggest power of 2 that is less than or equal to the remaining number and place a 1 in that position

Let's try converting the number 13. Start with zeros in all four positions.
◊(deci->bin-table 8 4)
8 is the biggest power of 2 that is less than or equal to 13, so we put a 1 in the 8's position.}
    ◊step{
Subtract the chosen power of 2 from the remaining number and repeat until the remainder is 0

13 − 8 = 5. Now 4 is the biggest power of 2 that is less than or equal to 5, so we put a 1 in the 4's position.
◊(deci->bin-table 12 4)

5 − 4 = 1. The 2's position stays 0 because 2 is greater than the remaining number, 1. We choose 1, put a 1 in the 1's position, and subtract: 1 − 1 = 0.

Leave 0 in every unused position.
◊(deci->bin-table 13 4)
8 + 4 + 0 + 1 = 13; thus ◊(base "1101" 2) represents ◊(base 13 10).}}

◊lead{Check your understanding!}
◊(q "What is the decimal number 11 in binary?" (deci->bin-table 11 4) "answer: 1011; because 8 + 2 + 1 = 11")
◊(q "What is the decimal number 15 in binary?" (deci->bin-table 15 4) "answer: 1111; because 8 + 4 + 2 + 1 = 15")
◊q{
What is the decimal number 233 in binary?
◊(deci->bin-table 233 8)
answer: 11101001; which you can confirm adds up to 233. Notice how we needed to expand to 8 bits to represent this number because 233 can only fit into 8 bits or higher: ◊(2^ "8") = 256
}

◊h3{Division method}
◊steps{
    ◊step{
     Divide by 2 and record the whole-number quotient and remainder

     Let's try converting 233. Dividing 233 by 2 gives a quotient of 116 and a remainder of 1: 233 = 2 × 116 + 1.
    }
    ◊step{
        Repeat with the quotient until the quotient becomes 0

        Next, divide 116 by 2 to get a quotient of 58 and a remainder of 0. Keep dividing each new quotient by 2 and record its remainder.
        ◊(deci->div-table (deci->bin-div 233) #:caption "11101001")

        The remainder is always 0 or 1. Stop after the row where dividing 1 by 2 gives a quotient of 0 and a remainder of 1.
    }
    ◊step{
        Read the remainders from bottom to top

        The first remainder gives the 1's bit: it tells us whether the number is even (0) or odd (1). Dividing by 2 removes that bit, so the next remainder gives the original number's 2's bit, then the 4's bit, and so on. We find the bits from right to left, which is why we read the table from bottom to top.

        From bottom to top, the remainders are 11101001, so ◊(base "11101001" 2) = ◊(base 233 10).
    }}

◊lead{Check your understanding!}

Use the division method

◊(q "What is 16 in binary?" ◊(deci->div-table ◊(deci->bin-div 16) #:caption "10000")
◊(deci->bin-table 16 5))

◊(q "What is 23 in binary?" ◊(deci->div-table ◊(deci->bin-div 23) #:caption "10111")
◊(deci->bin-table 23 5))

◊q{What is 30 in binary? 
◊(deci->div-table ◊(deci->bin-div 30) #:caption "11110")

◊(deci->bin-table 30 5)
}

◊hr{}

◊h2{Review Questions}
Try answering each question before opening it to check your reasoning. Treat all numbers as unsigned.

◊q{How many different patterns/combinations can 6 bits represent?
◊p{Each bit has 2 possible values, so 6 bits give us ◊(2^ 6) = 64 different patterns.}
}

◊q{What are the smallest and largest unsigned values that 6 bits can represent?
◊p{The smallest value is 0, and the largest is ◊(2^ 6) − 1 = 63. Zero uses one of the 64 patterns, so the values range from 0 through 63.}
}

◊q{Do 101 and 00000101 represent different unsigned values? Do they have the same bit width?
◊p{Both represent 5: 4 + 1. Leading zeros do not change the value, but they do change the written bit width. ◊code{101} has 3 bits, while ◊code{00000101} has 8 bits.}
}

◊q{How can you tell whether an unsigned binary number is even or odd by looking at just one bit?
◊p{Look at the rightmost bit. If it is 0, the number is even; if it is 1, the number is odd. Every other position has an even weight, so only the 1's bit determines whether the total is even or odd.}
}

◊q{How many different patterns/combinations can 9 bits represent?
◊p{Each bit has 2 possible values, so 9 bits give us ◊(2^ 9) = 512 different patterns.}
}

◊q{What are the smallest and largest unsigned values that 9 bits can represent?
◊p{The smallest value is 0, and the largest is ◊(2^ 9) − 1 = 511. Zero uses one of the 512 patterns, so the values range from 0 through 511.}
}