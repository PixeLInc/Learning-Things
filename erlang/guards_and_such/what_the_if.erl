-module(what_the_if).
-export([heh_fine/0, oh_god/1, help_me/1]).

% This will error out
% `No true branch found when evaling an if expression`
% meaning: No clause from the if will ever match bc its only guard evals
% to false. 

% Remember: EVERYTHING in Erlang must return something, and if expressions
% are no exception to that rule.

% As such, when Erlang can't find a way to have a guard succeed, it will crash.
% It cannot return anything.
heh_fine() ->
  if 1 =:= 1 ->
    works
  end,
  if 1 =:= 2; 1 =:= 1 ->
    works
  end,
  if 1 =:= 2, 1 =:= 1 ->
    fails
  end.

% To combat this, we can do a `catch-all` branch.
% This will always succeed no matter what.
% In most langs, this will be called an `else`.
% Erlang uses `true`. Hence the no `TRUE` branch found
oh_god(N) ->
  if N =:= 2 -> might_succeed;
     true -> always_does % This is erlang's if's else!
  end.      

% Showing how to use many guards in an `if`
% Also illustrates how any expression must return something.
% When reading, it's easy to see how the lack of a `true` branch would
% mess things up, considering Erlang has no such thing as a null value
% This one would be better as a pattern match in function heads.
% This is for an example
help_me(Animal) ->
  Talk = if Animal == cat -> "MOOEWWE";
            Animal == beef -> "Mooooof";
            Animal == dog -> "BORK!";
            Animal == tree -> "BARK!"; % I didnt know a tree was an animal owo
            true -> "askfjdbsdkjfb"
          end,
  {Animal, "says " ++ Talk ++ "!"}.