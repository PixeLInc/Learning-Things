Notes on files (`guards.erl` & `what_the_if.erl` & `cases.erl`)

Note: Guards **MUST** return true to succeed at some point.
  The guard will fail if it returns false or if it throws an exception.

The comma ( , ) acts like an `andalso` operator meaning
that both must succeed for it to pass.

The semicolon ( ; ) acts like the `orelse` operator: 
  If the first guard fails, it tries the second, and the next, 
  and the next, until either one succeeds or they all fail.

A negative thing about guards is that they **DO NOT** accept user-defined
functions due to side effects.
Erlang is not a purely functional prog. lang. (like Haskell) because
it relies on side effects a lot.
So, Erlang just does not trust you for user-defined funcs.

---------------------

### WHAT THE IF?!

Notes on why 'true' was taken over 'else' as an atom to control flow

It may be more FAMILIAR, but that doesn't mean 'else' is a good thing. 
I know that writing '; true ->' is a very easy way to get 'else' in Erlang, but we have a couple of decades of psychology-of-programming results to show that it's a bad idea. 
I have started to replace:
```
                  by
if X > Y -> a()		   if X > Y  -> a()
  ; true  -> b()		  ; X =< Y -> b()
end		     	         end

if X > Y -> a()		   if X > Y -> a()
  ; X < Y -> b()		  ; X < Y -> b()
  ; true  -> c()		  ; X ==Y -> c()
end			             end
```
  
which I find mildly annoying when _writing_ the code but enormously helpful when _reading_ it.

Else or True brancheds should be avoided altogether: ifs are usually easier to read 
when you cover all logical ends rather than relying on a catch all.

-----------------

#### WHICH TO USE? OMG!!!!!

Which to use is rather a hard thing to answer.
The difference between function calls and `case ... of` are super minimal:
  In fact, they are represented the same way at lower level, and using
  one or the other effectively has the same cost in terms of performance.
One difference between both is when more than one arg needs to be eval'd.
`function(A, B) -> ... end` can have guards and values to match against
A and B but a case expression would need to be formulated a bit like:
```erlang
case {A, B} of
  Patter guards -> ...
end.
```
This form is rarely seen.

In similar situations, a function call may be more appropriate.
On the other hand, the `insert/2` function in (`cases.erl`) written
is arguably cleaner in the way it is rather than having an immediate function call to
track down on a simple `true` or `false` clause.


this next part I just copied from the website since I didnt
feel like typing myself for it since it was already worded fine 
--

Then the other question is why would you ever use if, 
given cases and functions are flexible enough to even encompass if through
guards? The rationale behind if is quite simple: it was added to the 
language as a short way to have guards without needing to write the 
whole pattern matching part when it wasn't needed.

Of course, all of this is more about personal preferences 
and what you may encounter more often. There is no good solid answer. 
The whole topic is still debated by the Erlang community from time to time.
Nobody's going to go try to beat you up because of what you've chosen,
as long as it is easy to understand. As Ward Cunningham once put it, 
"Clean code is when you look at a routine and it's pretty much what you 
expected."