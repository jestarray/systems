#lang pollen
◊h1{Binary Addition}

◊(yt "_XEl45i8YqM")

◊h2{How to add binary numbers?}

◊lead{All 5 possible scenarios of binary addition:}

◊(img-row "/images/bin-1.svg" "/images/bin-2.svg" "/images/bin-3.svg" "/images/bin-4.svg" "/images/bin-5.svg")
    
You add binary numbers the same as you would regular decimal numbers! In a decimal system, we carry to the left whenever we go above 9. In a binary system we carry when we go above 2 as highlighted in red.

To make sense of why 1 + 1 + 1 = 11, imagine 5 + 5 + 5. We add the two fives: 5 + 5 = 10 and we have to carry over the 1 but we still have a 5 left over, leaving us with 15.

Let's add 4 bit binary numbers 0111 + 1110. 

◊steps{
    ◊step{
        Start from right to left (<--)
        ◊(pre "
  0 1 1 1 (7)
+ 1 1 1 0 (14)
__________
        1
        ")
    }
    ◊step{Add normally and carry as needed
◊(layout-spread-row
◊(pre "
    1 <- carry 
  0 1 1 1 (7)
+ 1 1 1 0 (14)
__________
      0 1 ")
◊(pre "
  1 1 <- carry 
  0 1 1 1 (7)
+ 1 1 1 0 (14)
__________
    1 0 1  ")
◊(pre "
1 1 1 <- carry 
  0 1 1 1 (7)
+ 1 1 1 0 (14)
__________
1 0 1 0 1 (21) ")
)
    }
    ◊step{
       Consider effect of overflow 
              ◊(pre "
 1 1 1 <- carries 
  [0 1 1 1] (7)
+ [1 1 1 0] (14)
_______
 1[0 1 0 1] (21) or (5 if we can't expand)
        ")
        The answer can be either 0101 or 10101 on paper! In software however it depends on the programming language. Some decide to crash(rust), some end up wrapping around (C)

        Recall that computers have finite limits to what they can represent as noted by the brackets [] indicating a fixed width. 4 bits can only represent a maximum number of 16 things, and here, the sum of the two numbers go over 15! The overflow bit may be dropped if we can't expand the bit-width, resulting in 5 as our answer. This property will be important later.
    }
}

◊(max-unsigned-limit-table 4)

◊lead{Check your understanding!}
◊(q "What is 101 + 001 ? (given a 3 bit-width)" ◊(pre "
    1
  1 0 1 (5)
+ 0 0 1 (1)
________
  1 1 0 (6)
"))

◊(q "What is 111 + 111 ? (given a 3 bit-width)" ◊(pre "
1 1 1
  1 1 1 (7)
+ 1 1 1 (7)
________
1 1 1 0 (14) or (6 because of overflow wraparound)
"))

◊a[#:href "https://jest-systems.netlify.app/#binary_addition(unsigned)"]{More Binary Addition problems with variable bit-width Here}