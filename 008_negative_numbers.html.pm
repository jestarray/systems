#lang pollen
◊h1{Negative Binary Numbers}

◊(yt "Q32TDUTGfQM")

◊h2{Negative aka Signed Numbers in Two's Complement}
Signed numbers are numbers that can take on ◊b{negative} values. It's called ◊b{signed} because it can take on a "negative sign" as well as a positive sign. This notation of representing negative numbers is called ◊b{two's complement}.

◊lead{To get the binary representation of a negative number, say -6, we have to:}

◊steps{
  ◊step{
    Write the number positive version in binary
    ◊(deci->bin-table 6 4 #:caption "6 in binary")
  }
  ◊step{
    Flip all the bits
    ◊pre{
      0 1 1 0 (6) becomes...
      _______
      1 0 0 1 (FLIPPED)
    }
  }
  ◊step{Add one to the flipped result
◊(layout-spread-row
  ◊(pre
    "     
          1
      1 0 0 1 
    + 0 0 0 1
    _________
            0
    "
    )
  ◊(pre
    "     
          1
      1 0 0 1
    + 0 0 0 1
    _________
      1 0 1 0 (-6)
    "
    )
)
Answer: -6 in binary is 1010. 
Let's talk about two's complement and what logistics drive 1010 = -6
  }
}

◊h2{How Two's complement encoding works}

◊(deci->bin-table -6 4 #:caption "-8 + 2 = -6 (4 bit-width)")
◊(deci->bin-table -6 6 #:caption "-32 + 16 + 8 + 2 = -6 (6 bit-width)")
◊(deci->bin-table -6 8 #:caption "-128 + 64 + 32 + 16 + 8 + 2 = -6 (8 bit-width)")

◊strong{Notice: Only the most significant bit(left most highlighted in red) holds is of a negative weight.} 

Given a bit-width of 4, the decimal number ◊(base -6 10) = ◊(base 1010 2)
Given a bit-width of 6, the decimal number ◊(base -6 10) = ◊(base 111010 2)
Given a bit-width of 8, the decimal number ◊(base -6 10) = ◊(base 11111010 2)

When representing negative numbers, ◊strong{the width matters, because only the most signifncant bit(left most as highlighted in red) holds the negative weight} needed to split the positive and negative numbers as seen in the table way below. It's important to notice that all negative numbers have a leading bit of 1.

Let's try a few examples with variable bit-widths:

◊lead{Check your understanding!}
◊(q "What is -3 in binary?(given a bitwidth of 4)" ◊(deci->bin-table -3 4 #:caption "-8 + 4 + 0 + 1 = -3"))
◊(q "What is -15 in binary? (given a bitwidth of 5)"  ◊(deci->bin-table -15 5 #:caption "-16 + 0 + 0 + 0 + 0 + 1 = -15"))
◊(q "What is -20 in binary? (given a bitwidth of 6)"  ◊(deci->bin-table -20 6 #:caption "-32 + 0 + 8 + 4 + 0 + 0 = -20"))

◊a[#:href "https://jest-systems.netlify.app/#decimal_to_binary(two's_complement)"]{More Two's Complement Exercises}


◊h2{Multiple Meanings}

In English we  have words like 

"bark":
◊ol{
    ◊li{A noise that a dog makes.}
    ◊li{What trees are mare out of.}
}
"sex":
◊ol{
  ◊li{either of the two main categories (male and female) into which humans and most other living things are divided on the basis of their reproductive functions.}
  ◊li{an activity}
}

◊h4{One word, multiple meanings!}
Likewise in the world of bits, the bit pattern: ◊(base 1101010 2) can mean:
◊ol{
    ◊li{The letter "j"}
    ◊li{The number ◊(base 106 10)}
    ◊li{The number ◊(base -22 10)}
    ◊li{The hexadecimal number ◊(base "D2" 16)}
}
Computers only see zeros and ones, its how and what we humans decide to interpret them that gives them meaning/value.

◊h2{Multiple interpretations of bits}

Given the bit-width of 4: 

◊(base -6 10) in binary is ◊(base 1010 2), but wait...

◊(base 10 10) in binary is ◊(base 1010 2), also?! 

They both use the same pattern of bits? What gives?!

Consider all the possibilities of unsigned and signed 4 bit numbers:

◊(layout-spread-row ◊(max-unsigned-limit-table 4) ◊(max-signed-limit-table 4))

Again, as highlighted in red, the most significant bit(left most bit) in a signed number ◊(2^ "bitwidth-1") takes on a ◊b{negative weight} (in this case it's 8).

◊(layout-spread-row
◊(deci->bin-table 10 4 #:caption "8 + 2 = 10 (unsigned)")
◊(deci->bin-table -6 4 #:caption "-8 + 2 = -6 (signed)")
)

Now knowing that bit patterns can have 2 (or more) meanings, let's go the other way around get some practice converting bit patterns to signed and unsigned decimal representations.

◊lead{Check your understanding!}
◊(q "What is 0111 in both signed and unsigned decimal? (given a bitwidth of 4)" 
◊(deci->bin-table 7 4 #:caption "0 + 4 + 2 + 1 = 7 (signed)")
◊(deci->bin-table 7 4 #:caption "0 + 4 + 2 + 1 = 7 (unsigned)")
"answer: 7,7"
" ! they're the same because its in the safe range of bit patterns they share in common")

◊(q "What is 101100 in both signed and unsigned deicmal? (given a bitwidth of 6)" 
◊(deci->bin-table -20 6 #:caption "-32 + 0 + 8 + 4 + 0 + 0 = -20 (signed)") 
◊(deci->bin-table 44 6 #:caption "32 + 0 + 8 + 4 + 0 + 0 = 44 (unsigned)")
"answer: -20,44"
)

◊(q "What is 10001 in both signed and unsigned decimal? (given a bitwidth of 5)"  
◊(deci->bin-table -15 5 #:caption "-16 + 0 + 0 + 0 + 0 + 1 = -15 (signed)") 
◊(deci->bin-table 17 5 #:caption "16 + 0 + 0 + 0 + 0 + 1 = 17 (unsigned)")
"answer: -15,17")

◊a[#:href "https://jest-systems.netlify.app/#binary(two's_complement)_to_decimal(unsigned_and_signed)"]{More Two's complement signed and unsigned exercises}

The safe range of converting numbers back and forth between the worlds of unsigned and signed in a 4 bit system is: 0 to 7. This is where the bitpatterns are exactly the same. Everywhere else, they differ and mismatch which can cause wrap around issues and wrong math which we will cover extensively in the next section. Notice however that when you cast between signed to unsigned and vice versa, the bit patterns do not change but the resulting decimal value does.

If we want  to represent -14, it's only possible in bit-width of 5 and above. Lets see this in action:

◊more-examples{
  ◊h4{Step 1: Write the number positively in binary}
  ◊(deci->bin-table 14 4 #:caption "14 in binary")
  ◊h4{Step 2: Flip all the bits}
  ◊pre{
    1110
    FLIP
    0001}
  ◊h4{Step 3: Add one to the flipped result}
  ◊pre{
◊(layout-spread-row
  ◊(pre
    "     
          1
      0 0 0 1 
    + 0 0 0 1
    _________
            0
    "
    )
  ◊(pre
    "     
          1
      0 0 0 1
    + 0 0 0 1
    _________
      0 0 1 0 (2)
    "
    ))
  }
  I mistakenly did this in a 4 bit width, and got the wrong answer of 2. Consulting the table above, -14 doesn't fit in a bit width of 4. Again! You must always consider the width when dealing with negative numbers. Extend the width to 5 bits and re-doing the steps above will work: 
  ◊(deci->bin-table 14 5 #:caption "0 + 8 + 4 + 2 + 0 = 14")
  You should end up with:
  ◊(deci->bin-table -14 5 #:caption "-16 + 0 + 0 + 2 + 1 = -14")
}

◊(q
"How does the computer tell apart signed and unsigned numbers?"
"It doesn't! We manaully tell the computer by declaring the type signed or unsigned. In scripting languages like Python, Javascript, etc, this is hidden from you by way of having all numbers be signed by default. In other languages like C, you have to explicitly declare how many bits a number has, and whether the number can be signed or unsigned, which will flip a switch on the CPU that tells it to interpret a binary number to be negative by considering the left most bit to have a negative weight.")