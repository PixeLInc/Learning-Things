-module(cases).
-export([insert/2]).

% Note: This is possibly the worst impl. in terms of efficiency
% BUT WE ARE LOOKING AT SYNTAX K

% If we send an empty list, X ill be added, it returns us a list only 
% containing X.
% Otherwise, the function `lists:member/2` checks whether an elem is part
% of a list, and returns true if it is, false if it is not.
% In the case we already had the elem X in the set, we do not need to modify the list.
% otherwise, X will be added as the list's first elem.
insert(X, []) ->
  [X];
insert(X, Set) ->
  case lists:member(X, Set) of
    true -> Set;
    false -> [X | Set]
  end.

% In this case, the pattern matching was really simple.
beach(Temperature) ->
  case Temperature of
    {celsius, N} when N >= 20, N =< 45 ->
      'favorable';
    {kelvin, N} when N >= 293, N =< 318 ->
      'scientifically favorable';
    {fahrenheit, N} when N >= 68, N =< 113 ->
      'favorable in the US (damn americans)';
    _ ->
      'Avoid the beach'
  end.

% we could've written the following as well, as it's the same
beachf({celsius, N}) when N >= 20, N =< 45 ->
  'favorable';
% all the others
beachf(_) ->
  'Avoid the beach'.

% Refer to the 'README.md' for the answer to:
% When should we use `if` `case .... of` or functions to do cond. expressions?!