Lots and Lots and Lots and Lots and Lots... of Recursion!
----
**TODO: Probably add a little more notes? Explain better? Different wording?**

There's a lot going on in `recursion.erl` that may or may not be confusing so let's break down what each of the functions do.\
Pls note: **All of these functions are not optimized or anything so they are not to be used in production. There are many other better functions**

So, first off we have
```erlang
fac(0) -> 1;
fac(N) when N > 0 -> N * fac(N - 1).
```
This just finds the factorial of a number, simple enough.. right? :)

Next up we got:
```erlang
len([]) -> 0;
len([_|T]) -> 1 + len(T).
```
This finds the length of the inputted list.
For ya visualizers:
```
len([1,2,3,4]) = len([1 | [2,3,4])
               = 1 + len([2 | [3,4]])
               = 1 + 1 + len([3 | [4]])
               = 1 + 1 + 1 + len([4 | []])
               = 1 + 1 + 1 + 1 + len([])
               = 1 + 1 + 1 + 1 + 0
               = 1 + 1 + 1 + 1
               = 1 + 1 + 2
               = 1 + 3 
               = 4
```

Next up:
```erlang
tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) when N > 0 -> tail_fac(N - 1, N * Acc).

tail_len(L) -> tail_len(L, 0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc + 1).
```
Now, there's 2 different things here but they both use the tail.\
One just finds the factorial of the tail, the other just finds the length of the tail.\
Simple enough, does the same thing expect uh.. tailier.

On to, Reverse!
```erlang
reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].

tail_reverse(L) -> tail_reverse(L, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).
```
This just reverses a list, and reverses the tail of a list. WOW!\
It takes the tail, and appends to the HEAD of the list to reverse it, pretty cool right?

Sublist
```erlang
sublist(_, 0) -> [];
sublist([], _) -> [];
sublist([H|T], N) when N > 0 -> [H | sublist(T, N - 1)].

tail_sublist(L, N) -> reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 -> tail_sublist(T, N - 1, [H|SubList]).
```
All this does is you input it a number (X) and it takes the first X elements out of a list.
For example:
```
> recursion:sublist([1, 2, 3, 4], 2).
[1,2]
```

Now onto zip
```
zip([], []) -> [];
zip([X|Xs], [Y|Ys]) -> [{X, Y} | zip(Xs, Ys)].

lenient_zip([], _) -> [];
lenient_zip(_, []) -> [];
lenient_zip([X|Xs], [Y|Ys]) -> [{X, Y} | lenient_zip(Xs, Ys)].
```
zip groups items together, basically.\
``A zipping function will take two lists of same length as parameters and will join them as a list of tuples which all hold two terms. ``

Now, onto the last thing. Quicksort
```erlang
quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
  {Smaller, Larger} = partition(Pivot, Rest, [], []),
  quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_, [], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) -> 
  if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
     H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
  end.
```
This sorts things..
A good example, and something that will hopefully help explain it further:
```
> recursion:quicksort([1, 2, 3, 4]).
[1,2,3,4]
> recursion:quicksort([4, 7, 123, 32, 3]).
[3,4,7,32,123]
> recursion:quicksort(["a", "b"]).
["a","b"]
> recursion:quicksort(["b", "a"]).
["a","b"]
> recursion:quicksort(["zsad", "asd", "asda"]).
["asd","asda","zsad"]
> recursion:quicksort(["zsad", "asd", "asda", "asdc", "asdb"]).
["asd","asda","asdb","asdc","zsad"]
> recursion:quicksort([dsd, dsd ,as,d ,a,sd ,gd,fg]).
[a,as,d,dsd,dsd,fg,gd,sd]
```

Trees & Stuff (No not the trees outside)
--

Snippets from the website

**First of all, it's important to define what a tree is. 
In our case, it's nodes all the way down. Nodes are tuples that contain a key, 
a value associated to the key, and then two other nodes. 
Of these two nodes, we need one that has a smaller and one that has a larger key than the node holding them. 
So here's recursion! A tree is a node containing nodes, each of which contains nodes, 
which in turn also contain nodes. 
This can't keep going forever (we don't have infinite data to store), 
so we'll say that our nodes can also contain empty nodes.**

By using that function and then encapsulating all representations of nodes the same way, 
we hide the implementation of the tree so people don't need to know how it's built.
All that information can be contained by the module alone. If you ever decide to change the representation of a node, 
you can then do it without breaking external code.

To add content to a tree, we must first understand how to recursively navigate through it.
Let's proceed in the same way as we did for every other recursion example by trying to find the base case. 
Given that an empty tree is an empty node, our base case is thus logically an empty node. 
So whenever we'll hit an empty node, that's where we can add our new key/value. 
The rest of the time, our code has to go through the tree trying to find an empty node where to put content.

To find an empty node starting from the root, we must use the fact that the presence of Smaller and Larger nodes
let us navigate by comparing the new key we have to insert to the current node's key.
If the new key is smaller than the current node's key, we try to find the empty node inside Smaller,
and if it's larger, inside Larger. 
There is one last case, though: what if the new key is equal to the current node's key? 
We have two options there: let the program fail or replace the value with the new one.


Just a little output for `tree.erl` to show what's going on:
```
48> c(tree).
tree.erl:2: Warning: export_all flag enabled - all functions will be exported
{ok,tree}
49> T1 = tree:insert("Bob Rawr", "lol@lol.com", tree:empty()).
{node,{"Bob Rawr","lol@lol.com",{node,nil},{node,nil}}}
50> T2 = tree:insert("Mark A", "rawr@xd.nuzzle", T1).
{node,{"Bob Rawr","lol@lol.com",
       {node,nil},
       {node,{"Mark A","rawr@xd.nuzzle",{node,nil},{node,nil}}}}}
51> Addresses = tree:insert("Aaaa", "asd@ASD.CAD", tree:insert("KEVO", "fukkkk@owo.owo", tree:insert("omg", "yes", T2))).
{node,{"Bob Rawr","lol@lol.com",
       {node,{"Aaaa","asd@ASD.CAD",{node,nil},{node,nil}}},
       {node,{"Mark A","rawr@xd.nuzzle",
              {node,{"KEVO","ohhia@owo.owo",{node,nil},{node,nil}}},
              {node,{"omg","yes",{node,nil},{node,nil}}}}}}}
52> tree:lookup("Aaaa", Addresses).
{ok,"asd@ASD.CAD"}
53> tree:lookup("no_existo", Addresses).
undefined
54>
```