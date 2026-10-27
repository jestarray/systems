#lang pollen
◊h1{Language}
◊h2{Bits}

A bit holds a value that is either 1 or a 0. Beyond ◊strong{what a bit is}, let's look at what it ◊strong{does}. A bit ◊strong{conveys information}, granted it's a very tiny amount. 

◊h2{What can we do with 1 bit?}

With 1 bit, we can convey only 2 possibilities. For example: 

Do you like the movie?

◊(table (table-headings (list "Bit" "Information")) (table-entries (list 0 "No") (list 1 "Yes")))

To convey more complex information, we need to string together multiple bits!

◊h2{2 bits}

With ◊em{2 bits}, we brought the combination of things we can ◊em{represent} to a total of ◊em{4}.
◊(table (table-headings '("Bit1" "Bit2" "Information"))
(table-entries 
(list 0 0 "Bad")
(list 0 1 "Okay")
(list 0 1 "Great")
(list 0 1 "WOAHHH")
))

◊h2{3 bits}
With 3 bits, the maximum limit of patterns we can make is 8.
◊(table (table-headings '("Bit1" "Bit2" "Bit3" "Information"))
(table-entries 
(list 0 0 0 0)
(list 0 0 1 1)
(list 0 1 0 2)
(list 0 1 1 3)
(list 1 0 0 4)
(list 1 0 1 5)
(list 1 1 0 6)
(list 1 1 1 7)
))

◊h2{Finite Limit of Information}
◊img[#:src "/images/calculator_error.jpeg"]{}

Notice that the number of things we can represent is ◊strong{finite} and determined by the number of bits we have. If you've ever hit an error with calculators dealing with large numbers, chances are because it ran out of bits to represent numbers. If we built a 3 bit calculator, going over 7 will result in a crash(we include 0) because we ran out of patterns of 01s to represent the next number. 

Can you guess how many unique patterns you can make with 4 bits? 

The formula for finding the maximum limit patterns is ◊(2^ "n"), where n is how many bits we have. So ◊(2^ 4) = 16. 

We will be building a 16 bit(1970s) computer, so what is the maximum number of things? 65536
Modern computers these days are 32bits(1990s) which can represent: 4,294,967,296
and 64bits(2000s): 18,446,744,073,709,551,615 (reads 18 quintillion).

You may be wondering, a processor from the 1970s? Isn't what we learn going to be outdated and irrelevant?
No, surprisingly 99% of the underlying architecture remains the same to this day.

So in conclusion:
◊ul{
    ◊li{
 binary is like a 2 letter alphabet system that computers use because it is a very efficent minimal language and it's very cheap and fast to mass produce technology that operates on binary values.
    }
    ◊li{
there is a limit to how many things computers can represent
    }
    ◊li{
the amount of things we can represent is determined by how many bits we have, ◊(2^ "n") - 1
    }
}

In the next section, we'll explore how binary can express actions!