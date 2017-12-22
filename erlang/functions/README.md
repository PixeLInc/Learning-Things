Most of this stuff in the `functions.erl` is most likely going to be pattern matching and such
(http://learnyousomeerlang.com/syntax-in-functions)

```
io:format and tokens:
  ~n -> line break
  ~s -> token thing to replace
  ~p -> print an Erlang term nicely
```

Example of usage:
  `io:format("~s!~n", ["Hello"]) -> "Hello!\n"`

In other languages, we do:
```
function(Args)
  if X then
    Expression
  else if Y then
    Expression
  else
    Expression
 ```

BUT, in erlang, we do:
```
function(X) ->
  Expression;
function(Y) ->
  Expression;
function(_) ->
  Expression.
```

##### Bound VS Unbound variables:
```
Unbound -> A variable with nothing attached to it
Bound -> Something attached to an unbound variable
 ```

Now, if you want to assign a value to a var that is already bound
an error would occur **UNLESS** the new value is the same as the old one

Same values for bound are fine, different ones are not.