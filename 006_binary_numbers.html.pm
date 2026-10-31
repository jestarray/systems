#lang pollen
◊(require txexpr)

◊(define (deci->div-table e #:caption [caption empty])
    (table #:caption caption (table-headings (list "Division" "Quotient" "Remainder"))
        (table-entries e)))

◊(yt "bFLB4dyNKUk")

◊h1{Binary Numbers}

◊slide{
◊h2{Base 10}
◊object[#:data "/images/decimal_yellow_lock.svg" #:type "image/svg+xml"]{}

Humans typically use a ◊strong{base-10 (decimal) number system}, likely because we have 10 fingers.

Use this rotating lock to count. Every time we add 1, we rotate the rightmost wheel forward by one digit. But what happens when we reach 9 and want to add another 1?

We've run out of digits! The rightmost wheel rolls back to 0, and the wheel to its left advances by 1. We've gone from ◊strong{09 to 10}.

But notice something interesting: ◊strong{the position of each digit determines its value}.

Each position has a weight of ◊strong{10^n}, where n starts at 0 for the rightmost position and increases as we move left.

For our four-wheel lock, the weights from left to right are:

◊code{1000, 100, 10, 1}

To find the value of a number, multiply each digit by its position's weight and add the results.

For example, ◊strong{1234} means:

◊code{(1 × 1000) + (2 × 100) + (3 × 10) + (4 × 1) = 1234}

This is how our base-10 number system works.
}

◊slide{
◊h2{Base 2}
◊object[#:data "/images/binary_yellow_lock.svg" #:type "image/svg+xml"]{}


But what if we had a lock where each wheel had only ◊strong{two possible digits: 0 and 1}?

We'd start at 0, advance to 1, but then we'd already be out of digits! So the wheel rolls back to 0, and the next wheel advances to 1, giving us 10.

This is ◊strong{base 2, also known as binary}, the number system computers use.

Both number systems follow the same rules. The only difference is how many digits each wheel can display before rolling over.
}

Now just as these combination locks have a max limit of numbers it can represent, so do computers! It depends on the bit width.

4 bits gives us a maximum of 16 unique combinations because (◊(2^ "4") = 16).

◊(max-unsigned-limit-table 4)

Every 1 toggles corresponding powers of two: 
◊(table (table-headings (two-subscripts 4)) (table-entries (list 0 0 0 0)))

If we need more to represent numbers over 16, we need to expand to 5 bits, ◊(2^ 5) = 32

◊(table (table-headings (two-subscripts 5)) (table-entries (list 0 0 0 0 0)))

◊(hr)
◊h2{How to convert a binary number to a decimal number?}
◊steps{
    ◊(step "Look at where there is a 1" (deci->bin-table 7 4) 
    "Notice there are 1's underneeth the 4,2, and 1 headers")
    ◊(step "Sum up the corresponding power of 2 number" "you can think of it as an on/off switch" (deci->bin-table 7 4)  "0 + 4 + 2 + 1 = 7; thus our answer is 0111 represents 7")}

◊more-examples{
    ◊(deci->bin-table 4 4)
    0 + 4 + 0 + 0 = 4; thus 0100 represents 4.
    ◊(deci->bin-table 10 4) 8 + 0 + 2 + 0 = 10; thus 1010 represents 10.}

◊lead{Check your understanding!}
◊(q "What is the binary number 0011 in decimal?" (deci->bin-table 3 4) "answer: 3; because 2 + 1 = 3")

◊(q "What is the binary number 0101 in decimal?" (deci->bin-table 5 4) "answer: 5; because 4 + 1 = 5")

◊(q "What is the binary number 1001 in decimal ?" (deci->bin-table 9 4) "answer: 9; because 8 + 1 = 9")

◊(hr)
◊(h2 "How to convert a decimal number to a binary number?")

◊h3{Subtraction method}
◊steps{
    ◊step{
Find the biggest power of 2 that is less than the decimal number and place a 1 in that position

Let's try converting the number 13
◊(deci->bin-table 8 4)
8 is the biggest power of 2 that is less than 13, hence we put a 1 there.}
    ◊step{
Subtract it from the original number and repeat step 1 until you subtract to 0
13-8 = 5
◊(deci->bin-table 12 4)
Now we need to look for the next biggest power of 2 that is less than 5, which is 4, hence we put a 1 there.

◊p{5 - 4 = 1}
Lastly 1 fits with 1, so 1 - 1 = 0, and we are done.
◊(deci->bin-table 13 4) 8+4+0+1 = 13; thus 1101 represents 7}}

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
     Modulo the number by two
     Let's try for the number 233
     233/2 = 116 remainder 1
    }
    ◊step{
        Recursively modulo the quotient while keeping track of the remainder
        ◊(deci->div-table (deci->bin-div 233) #:caption "11101001")

        Note: The remainder will always be 0 or 1
    }
    ◊step{
        Gather all the remainders from bottom to top
        From bottom to top in the remainders column, 11101001, which is the binary representation of 233
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