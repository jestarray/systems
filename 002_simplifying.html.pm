#lang pollen

◊(yt "XYm5CQQeQPI")

◊slide{
◊h1{Simplifying logic gates}

Simplifying boolean expressions will help you build more efficient logic gates. In the real world this can save power, money, and make your chips smaller and faster. You will need to use some of these techniques in the upcoming projects.

}

◊slide{
◊h2{Factoring}

Quick! what is 
◊pre{8 * 27}

We can use the distributive property to break this down into something simpler:

◊pre{8 * (20 + 7)}

◊pre{160 + 56 = 216}
}
You could have did long multiplication, but the point is that, as long as we ◊strong{retain equality}, we can re-arrange pieces of the problem and tease out certain parts, which allows us to more easily reason about a solution, and this is the essence of algebra.

◊slide{
◊h2{Boolean Algebra}

Boolean algebra has some, but not all, similar properties to regular algebra on numbers, and they are:

◊h3{Communative Laws}

◊pre{(◊red{x} * ◊blue{y}) = (◊blue{y} * ◊red{x})}

◊pre{(◊red{x} + ◊blue{y}) = (◊blue{y} + ◊red{x})}

that is to say, it doesn't matter how you ◊strong{order} the inputs ◊red{x} or ◊blue{y} for * (AND) and + (OR)

◊h3{Associative Laws}

◊pre{(◊red{x} * (◊blue{y} * ◊green{z})) = ((◊red{x} * ◊blue{y}) * ◊green{z})}

◊pre{(◊red{x} + (◊blue{y} + ◊green{z})) = ((◊red{x} + ◊blue{y}) + ◊green{z})}

that is to say the order in which you ◊strong{group} operations doesn't matter for ◊strong{ALL} * (AND) and + (OR) operation groupings.

◊h3{Distributive Laws}
◊pre{(◊red{x} * (◊blue{y} + ◊green{z})) = (◊red{x} * ◊blue{y}) + (◊red{x} * ◊green{z})}

The ◊strong{major difference} in boolean algebra is that there's a ◊strong{2nd distributive law}, which says that we can distribute ◊strong{+(or)} over ◊strong{*(and)}, unlike regular algebra.
◊pre{(◊red{x} + (◊blue{y} * ◊green{z})) = (◊red{x} + ◊blue{y}) * (◊red{x} + ◊green{z})}

◊q{Example of why addition distributive law doesn't work for regular numbers
◊pre{2 + (3 * 4) = ◊red{14}}

If we apply the ◊strong{distributive law in boolean algebra law} to ◊strong{real numbers}, it won't work ❌

◊pre{(2 + 3) * (2 + 4) = ◊blue{30}}
◊pre{ ◊red{14} != ◊blue{30}}
}

◊h3{DeMorgan Laws}
◊pre{!(◊red{x} * ◊blue{y}) = !(◊red{x}) + !(◊blue{y})}

◊pre{!(◊red{x} + ◊blue{y}) = !(◊red{x}) * !(◊blue{y})}

that is to say we can distribute nots(!). Notice how ◊strong{+(OR)} turns into ◊strong{*(AND)} and vice versa when a not(!) is distributed.

◊h3{Idempotence Law:}

◊pre{◊red{x} + ◊red{x} = x}
◊pre{◊red{x} * ◊red{x} = x}
◊pre{◊red{!x} * ◊red{!x} = !x}

◊pre{◊red{xy + xy} + z = ◊red{xy} + z}

In other words, if an expression is just repeating operations on itself, you can simplify it to itself.

◊h3{Compliment Law:}

◊pre{◊red{!x} * ◊red{x} = 0}
◊pre{◊red{!x} + ◊red{x} = 1}

◊h3{Identity Law}

◊pre{◊red{x} + 0 = x}
◊pre{◊red{x} * 1 = x}

The identity law says that there are values that leave a Boolean expression unchanged—just like multiplying by 1 or adding 0 in ordinary arithmetic.
}

◊slide{
◊h2{Boolean Laws Cheatsheet}

◊table{
  ◊thead{
    ◊tr{
      ◊th{Law}
      ◊th{OR Form}
      ◊th{AND Form}
    }
  }

  ◊tbody{

    ◊tr{
      ◊td{Identity}
      ◊td{◊code{x + 0 = x}}
      ◊td{◊code{x * 1 = x}}
    }

    ◊tr{
      ◊td{Domination (Null)}
      ◊td{◊code{x + 1 = 1}}
      ◊td{◊code{x * 0 = 0}}
    }

    ◊tr{
      ◊td{Idempotent}
      ◊td{◊code{x + x = x}}
      ◊td{◊code{x * x = x}}
    }

    ◊tr{
      ◊td{Complement}
      ◊td{◊code{x + !x = 1}}
      ◊td{◊code{x * !x = 0}}
    }

    ◊tr{
      ◊td{Double Complement}
      ◊td{◊code{!!x = x}}
      ◊td{—}
    }

    ◊tr{
      ◊td{Commutative}
      ◊td{◊code{x + y = y + x}}
      ◊td{◊code{x * y = y * x}}
    }

    ◊tr{
      ◊td{Associative}
      ◊td{◊code{(x + y) + z = x + (y + z)}}
      ◊td{◊code{(x * y) * z = x * (y * z)}}
    }

    ◊tr{
      ◊td{Distributive}
      ◊td{◊code{x * (y + z) = (x * y) + (x * z)}}
      ◊td{◊code{x + (y * z) = (x + y) * (x + z)}}
    }

    ◊tr{
      ◊td{Absorption}
      ◊td{◊code{x + (x * y) = x}}
      ◊td{◊code{x * (x + y) = x}}
    }

    ◊tr{
      ◊td{De Morgan's}
      ◊td{◊code{!(x + y) = !x * !y}}
      ◊td{◊code{!(x * y) = !x + !y}}
    }

  }
}

◊h2{Derived Boolean Laws Cheatsheet}

◊table{
  ◊thead{
    ◊tr{
      ◊th{Derived Law}
      ◊th{Expression}
      ◊th{Notes}
    }
  }

  ◊tbody{

    ◊tr{
      ◊td{Absorption Variant}
      ◊td{◊code{x + (!x * y) = x + y}}
      ◊td{Very common simplification}
    }

    ◊tr{
      ◊td{Dual Absorption Variant}
      ◊td{◊code{x * (!x + y) = x * y}}
      ◊td{Dual of the above}
    }

    ◊tr{
      ◊td{Consensus Theorem}
      ◊td{◊code{(x * y) + (!x * z) + (y * z) = (x * y) + (!x * z)}}
      ◊td{Eliminates the redundant consensus term}
    }

    ◊tr{
      ◊td{Dual Consensus}
      ◊td{◊code{(x + y) * (!x + z) * (y + z) = (x + y) * (!x + z)}}
      ◊td{Dual of the Consensus Theorem}
    }

    ◊tr{
      ◊td{Redundancy}
      ◊td{◊code{(x * y) + (x * !y) = x}}
      ◊td{Factor then apply Complement}
    }

    ◊tr{
      ◊td{Dual Redundancy}
      ◊td{◊code{(x + y) * (x + !y) = x}}
      ◊td{Dual of Redundancy}
    }

    ◊tr{
      ◊td{Complement Expansion}
      ◊td{◊code{x = (x * y) + (x * !y)}}
      ◊td{Useful for proofs and canonical forms}
    }

    ◊tr{
      ◊td{Dual Complement Expansion}
      ◊td{◊code{x = (x + y) * (x + !y)}}
      ◊td{Dual of the above}
    }

    ◊tr{
      ◊td{Exclusive-OR}
      ◊td{◊code{x ⊕ y = (!x * y) + (x * !y)}}
      ◊td{Definition of XOR}
    }

    ◊tr{
      ◊td{Exclusive-NOR}
      ◊td{◊code{x ⊙ y = (x * y) + (!x * !y)}}
      ◊td{Definition of XNOR}
    }

  }
}
}

◊slide{
◊h2{Example Simplification}

◊lead{1. Simplify the following expression:}
◊pre{!(!x * !(x + y))}

◊lead{2. Using DeMorgans law on the inner !(x + y), we can turn it into this:}

◊pre{!(!x * ◊red{!}(x + y))}
◊pre{!(!x * ◊red{(!x * !y)})}

◊lead{3. Now the entire expression is only using *(ANDs), we can use the associative law to group and do the left part first:}

◊pre{!(!x * ◊red{(!x * !y)})}
◊pre{!(◊red{(!x * !x)} * !y)}

◊lead{4. Apply Idempotence Law (!x * !x) which simplifies to itself}
◊pre{!(◊red{(!x * !x)} * !y)}
◊pre{!(◊red{!x} * !y)}

◊lead{5. Apply DeMorgans Law again to distribute the outer ! to get:}
◊pre{◊red{!}(!x * !y)}

◊lead{6. Finally:}
◊pre{(x + y)}
◊lead{Conclusion:}
We went from this:

◊pre{◊green{!}(◊green{!}x ◊green{*} ◊green{!}(x ◊green{+} y))}

To this:

◊pre{(x + y)}

We took something that initially took ◊strong{5} ◊green{logic gates}, and simplified it to using only ◊strong{1}.

Another way to simplify is if you were given a truth table, you could pattern match against known logic gates and recognize it's an ◊strong{OR gate}.

◊(table 
(table-headings (list "x" "y" "f (x, y)"))
(table-entries 
(list 0	0 0)
(list 0	1 1)
(list 1	0 1)
(list 1	1 1)
) #:caption "!(!x * !(x + y))")
}

◊slide{
◊h2{Practice Problem C}

The following is a boolean function from the ◊a[#:href "https://computersystems.pages.dev/001_boolean_logic"]{previous section Problem B}. Simplify it using the laws above:
◊code{f(x, y) = (!x * !y) + (!x * y) + (x * !y)}

You are going to have to apply:
◊ul{
    ◊li{deductive reasoning}
    ◊li{boolean algebra and the laws}
    ◊li{expanding and factoring}
    ◊li{combining like terms}
}

◊q{Problem C Answer:

Given the original function:

◊code{f(x, y) = (◊red{!x} * !y) + (◊red{!x} * y) + (x * !y)}

◊strong{Step 1: Factor out common terms}
Notice that the first two terms both have !x:
◊code{f(x, y) = ◊red{!x} * (!y + y) + (x * !y)}

◊strong{Step 2: Apply Complement Law}
◊code{◊red{!y + y = 1}} (Complement Law)
◊code{f(x, y) = !x * ◊red{1} + (x * !y)}
Anything ◊code{* 1} is itself, so we just get:
◊code{f(x, y) = !x + (x * !y)}

◊strong{Step 3: Apply Absorption Law (or Distributive Law)}
Using the Identity Law: A + (!A * B) = A + B (this is a form of the Absorption/Reduction law)
◊code{f(x, y) = ◊red{!x + (x * !y)}}
Turns into:
◊code{f(x, y) = !x + !y}

◊strong{Step 4: Apply De Morgan's Law}
◊code{f(x, y) = ◊red{!}(x * y)}

◊strong{Answer}
◊code{!(x * y)}
}
}

◊slide{
◊h3t{Where to get more practice?}
I recommend you prompt AI:
◊quote{
    Generate me a boolean expression that involves 3 or 4 variables and simplify it using boolean laws, and explain the boolean laws you used.
}
}

◊h3t{Further boolean simplification}

The future projects will warn you when your boolean expressions aren't optimized, that's when you can either use your knowledge of boolean laws, or check out 
◊a[#:href "https://www.youtube.com/watch?v=RO5alU6PpSU"]{Karnaugh maps}
