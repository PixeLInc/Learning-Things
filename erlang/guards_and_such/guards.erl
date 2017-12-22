-module(guards).
-compile(export_all).

% Checks if the parameter (X) is greater/equal to 16 and returns true
old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.

% Disallow people older than 104 to drive, and people over 16 are allowed.
% So within 16-104 are allowed to drive.
right_age(X) when X >= 16, X <= 104 ->
  true;
right_age(_) ->
  false.

% You can also reverse the above function
wrong_age(X) when X < 16; X > 104 ->
  true;
wrong_age(_) ->
  false.