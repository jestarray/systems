#lang pollen
◊(require txexpr)

◊(define (deci->div-table e #:caption [caption empty])
    (table #:caption caption (table-headings (list "Division" "Quotient" "Remainder"))
        (table-entries e)))

◊(yt "bFLB4dyNKUk")

◊h1{Binary Numbers}
◊object[#:data "/images/binary.svg" #:type "image/svg+xml"]{}
◊object[#:data "/images/deci.svg" #:type "image/svg+xml"]{}

Humans use a base 10 number system for counting numbers, most likely because have 10 fingers. For example, using your fingers to do ◊code{8 + 4}, since we don't have 11 fingers we close our hands and have to hold a 10 in our mind, reset our fingers and add two: + 2 = 12.

◊img[#:src "/images/dolphin.svg" #:height "100px"]{}

This number system is natural for us but imagine a dolphin counting with it's 2 fins. 1 + 2 = 3, but they don't have 3 fins so they have to hold in their mind increments of 2. Computers are just like this in that they use a base 2 system(aka binary) of couting in contrast to our base 10(decimal).

Recall(in the language chapter) that 4 bits gives us a maximum of 16 unique combinations because (◊(2^ "4") = 16).

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