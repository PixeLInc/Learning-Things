-module(functions).
-compile(export_all). % exports all the functions in the file

% This is mainly patttern matching and such

% The same as the `erlang:hd/1` as it returns the first element of a list, or the 'head'
head([H|_]) -> H.

% Grab's the second thing from a list
second([_, X|_]) -> X.

% Checks if the two variables are the same
% Notes about this:
% the first X is seen as unbound: it auto takes the value `a`
% Then, erlang goes over the second arg, and it sees X is already bound
% it then compares it to the `a` passed as the second arg and looks to see
% if it matches. The match succeeds and the function returns true
% if they aren't the same then it fails, goes to the second clause
% which doesnt care about the variables and returns false

% This function can take any kind of argument you want
same(X, X) ->
  true;
same(_, _) ->
  false.

% A more advanced version of same/2
% But, there's an issue with this functions. IT takes ANY type of value
% It could be a string, atom, etc.
% Refer to GUARDS! :D (`guards.erl`)
valid_time({Date = {Y, M, D}, Time = {H, Min, S}}) ->
  io:format("The date tuple (~p) says today is: ~p/~p/~p,~n", [Date, Y, M, D]),
  io:format("The time tuple (~p) indicates: ~p:~p:~p.~n", [Time, H, Min, S]);
valid_time(_) ->
  io:format("Stop feeding me wrong data!~n").
