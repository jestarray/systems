#lang pollen

◊slide{
◊h1{Boolean Logic}
}
◊(yt "xLqQAcQvQzg")

◊slide{
  ◊h2{Booleans and Binary}
  ◊(table
     #:headings (list "Pair" "Common Domain")
     #:rows (list
       (list "0 / 1" "Computing")
       (list "False / True" "Logic")
       (list "Off / On" "General, electronics")
       (list "Low / High" "Electronics")))
}
The above terms are synonymous, in that they all refer to the same idea: ◊strong{binary values}. Earlier computers did not always use binary, it took decades of iteration to settle on binary because of its simplicity and efficiency.

◊slide{
  ◊h2{Logic}

  Languages need ways to express not just things, but what happens to those things.

  In English, verbs describe actions:

  ◊em{fight, run, attack, defend}

  In mathematics, operations transform quantities:

  ◊em{add, subtract, multiply, divide}

  In binary, boolean operations transform truth values and bits:

  ◊em{AND, NOT, OR, XOR ...}

  Boolean logic gives binary its "verbs."
}

◊slide{
◊h2{Operations on Binary Values}

◊layout-spread-row{
◊(table #:monospace? #t
   #:headings (list "A" "B" "OUTPUT")
   #:rows (list
     (list "0" "0" "0")
     (list "0" "1" "0")
     (list "1" "0" "0")
     (list "1" "1" "1"))
   #:caption (list "AND(*)" ◊img[#:src "/images/and_gate.svg"]{}))
◊(table #:monospace? #t
   #:headings (list "A" "B" "OUTPUT")
   #:rows (list
     (list "0" "0" "0")
     (list "0" "1" "1")
     (list "1" "0" "1")
     (list "1" "1" "1"))
   #:caption (list "OR(+)" ◊img[#:src "images/or_gate.svg"]{}))
◊(table #:monospace? #t
   #:headings (list "INPUT" "OUTPUT")
   #:rows (list
     (list "0" "1")
     (list "1" "0"))
   #:caption (list "NOT(!)" ◊img[#:src "images/not_gate.svg"]{}))
}
}
Above are 3 common boolean operations, ◊em{AND, NOT, OR} and their ◊em{truth tables}, which show ◊strong{all} possible inputs and outputs of each operation. The inputs are electrical signals that are either high or low voltage, which we represent as 1 and 0 respectively.

◊slide{
◊(table
   #:headings (list "Operation" "English" "Algebraic Notation" "Logic Notation" "Example")
   #:rows (list
     (list "AND" "both" ◊span{◊code{A * B} or ◊code{AB}} ◊span{◊code{A ∧ B}} ◊span{◊code{1 AND 0 = 0}})
     (list "OR" "either" ◊span{◊code{A + B}} ◊span{◊code{A ∨ B}} ◊span{◊code{1 OR 0 = 1}})
     (list "NOT" "opposite" ◊span{◊code{A̅}, ◊code{Ā}, or ◊code{A'} or ◊code{!A}} ◊span{◊code{¬A}} ◊span{◊code{NOT 1 = 0}})
     (list "XOR" "one or the other, but not both" ◊span{◊code{A ⊕ B}} ◊span{◊code{A ⊕ B}} ◊span{◊code{1 XOR 0 = 1}})
     (list "NAND" "NOT AND" ◊span{◊code{(AB)'} or ◊code{¯(AB)}} ◊span{◊code{¬(A ∧ B)}} ◊span{◊code{1 NAND 1 = 0}})
     (list "NOR" "NOT OR" ◊span{◊code{(A+B)'} or ◊code{¯(A+B)}} ◊span{◊code{¬(A ∨ B)}} ◊span{◊code{0 NOR 0 = 1}})))
}
Boolean operations re-use symbols from math such as addition and multiplication ◊code{+ *}, and work ◊strong{almost} the same. The important thing you have to watch out for is the case of ◊code{1 +(or) 1}. It's ◊strong{not} 2! Because we are working with binary values, not regular numbers! So use the truth table or speak out loud and read ◊strong{+} as ◊strong{OR} to resist your natural math instincts.

Let's evaluate some boolean expressions:

◊slide{
◊lead{Evaluate: ◊pre{!((1 * 0) + (1 + 1))}}
}
◊steps{
    ◊step{Evaluate the inner parentheses and work your way outwards
    Problem:
    ◊pre{!((1 * 0) + (1 + 1))}
    Solution:
    ◊pre{!((0) + (1))}
    ◊pre{! (1)}
    ◊pre{0}

    Answer: 0
    }
}
◊slide{
◊h2{Check your understanding!}
◊q{Evaluate: 1 * (0 + !(1))
    ◊pre{1 * (0 + !(1))}
    ◊pre{1 * (0 + 0)}
    ◊pre{1 * 0}
    ◊pre{0}

    Answer: 0
}

◊q{Evaluate: ((1 + 1) * (1 + 0)) + !(1 + 1)
    ◊pre{((1 + 1) * (1 + 0)) + !(1 + 1)}
    ◊pre{((1)     * (1))     + !(1)}
    ◊pre{(1) + 0}
    ◊pre{1}

    Answer: 1
}
}

◊hr{}
◊slide{
◊h2{Boolean Functions}
Abstracting to using functions instead of conrete values, since we're dealing with binary values, we have the luxury of knowing every possible input and output of a boolean function. 
}
◊slide{
◊lead{Take for example the boolean function}

◊code{f(x, y, z) = (x * y) + (!(x) * z)}

◊lead{Truth Table for f(x, y, z) }
◊(table #:monospace? #t
   #:headings (list "x" "y" "z" "f (x, y, z)")
   #:rows (list
     (list 0	0	0	0)
     (list 0	0	1	1)
     (list 0	1	0	0)
     (list 0	1	1	1)
     (list 1	0	0	0)
     (list 1	0	1	0)
     (list 1	1	0	1)
     (list 1	1	1	1)))
}
Given ◊strong{3} binary inputs, there can only be ◊strong{8} possible combinations, so we can write a table for every possible input, and evaluate the function to get the output(the last row).
Going from:
◊strong{Boolean function} → ◊strong{truth table} is pretty straight forward, we just plug in values and evaluate the boolean expression.
◊em{BUT}
◊strong{Truth table} → ◊strong{Boolean function} is a little more tricky. 

You'll be given a ◊strong{truth table}, and you're going to need to find the right combination of operations to write the ◊strong{boolean function} that produces the truth table. Let's explore why and how to do this with an example.

◊hr{}
◊slide{
◊h2{Truth Table to Boolean Function}
◊(yt "aDOtwH9_4vc")

How do you, given this truth table, write a boolean function that produces it?
◊(table #:monospace? #t
   #:headings (list "Mush" "Pep" "OUT" )
   #:rows (list
     (list 0	0 1)
     (list 0	1 0)
     (list 1	0 1)
     (list 1	1 1)))
}
Say you're throwing a party, and you only want pizzas that have ◊strong{both} mushrooms
◊strong{AND} pepperoni, ◊strong{OR} ones that only mushrooms, ◊strong{OR} ones that are plain with no toppings. Above is the truth table for this scenario.

To find the combination of operations that will allow the pizzas you want to pass, while rejecting ones you don't want, all you have to do is:

◊slide{
◊h2{Steps to convert Truth Table to a Boolean Function}
◊lead{This is called "Disjunctive Normal Form"}
◊steps{
    ◊step{
        Look at all the patterns that OUTputs 1
        The 1st, 3rd, and 4th row in the table above
        ◊(table #:monospace? #t
           #:headings (list "Mush" "Pep" "OUT" "☆")
           #:rows (list
             (list 0 0 1 "✅")
             (list 0 1 0 "❌")
             (list 1 0 1 "✅")
             (list 1 1 1 "✅")))
    }
    ◊step{
        Run a NOT operation on the 0's in those patterns then AND them together
        ◊(table #:monospace? #t
           #:headings (list "Mush" "Pep" "OUT" "Func")
           #:rows (list
             (list 0 0 1 "( !M * !P )")
             (list 1	0 1 "( M * !P )")
             (list 1	1 1 "( M * P )")))
        Those that are ◊code{1}'s remain the same, those that are ◊code{0}'s get a NOT operation, and then you AND them together to get
    }
    ◊step{
        Then OR all of the different patterns together
        Answer: ◊(pre
    "f(m,p) = (!M * !P) + (M * !P) + (M * P)"
)
    }
}
}
◊slide{
◊h2{Gate Implementation}
◊figure{
  ◊img[#:src "/images/pizza_gates.png"]{}
  ◊figcaption{◊a[#:href "https://circuitverse.org/users/14630/projects/45415" #:target "_blank"]{Pizza Gate Interactive Circuit for: ◊code{f(m,p) = (!M * !P) + (M * !P) + (M * P)}}}
}}
This perfectly implements our truth table that filters out pizzas that we don't want.
By cleverly combining and arranging these simple logic gates, we can create complex behavior. Everything you do on a computer from games, shopping, browsing the web, etc, all boils down to clever manipulations of 0's and 1's using these basic operations.

Try to come up with your own truth table and see if you can implement it with logic gates. Here are a few example problems:

◊slide{
◊h3t{Problem A}
Given the truth table, write the boolean function ◊code{f(x,y) = ...} and ◊a[#:href "https://circuitverse.org/simulator"]{implement it with logic gates}
◊(table #:monospace? #t
   #:headings (list "x" "y" "OUT")
   #:rows (list
     (list 0 0 0)
     (list 0	1 1)
     (list 1	0 0)
     (list 1	1 1)))
◊q{Problem A Answer: ◊code{f(x, y) = (!x * y) + (x * y)}

◊a[#:href "https://circuitverse.org/users/14630/projects/problem-a-5da02c57-82a9-4204-8e23-c6279f89eb2e"]{Circuitverse implementation}
}
}

◊slide{
◊h3t{Problem B}
Given the truth table, write the boolean function ◊code{f(x,y) = ...} and ◊a[#:href "https://circuitverse.org/simulator"]{implement it with logic gates}
◊(table #:monospace? #t
   #:headings (list "x" "y" "OUT")
   #:rows (list
     (list 0 0 1)
     (list 0	1 1)
     (list 1	0 1)
     (list 1	1 0)))

◊q{Problem B Answer: ◊code{f(x, y) = (!x * !y) + (!x * y) + (x * !y)}}

It's really important that you get used to being given a ◊strong{truth table} and converting it into a ◊strong{boolean function}, because this underlies so much of the of the upcoming problems.
◊a[#:href "https://circuitverse.org/users/14630/projects/problem-b-f-x-y-x-y-x-y-x-y"]{Circuitverse implementation}
}