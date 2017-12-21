-module(modules).
-export([add/2, hello/0, greet_and_add_two/1, print_info/0]).

add(X, Y) ->
  X + Y.

%% Standard output to console and such uses `io:format/1` from what I've seen.
hello() ->
  io:format("Hello world!~n").

greet_and_add_two(X) ->
  hello(),
  add(X, 2).

print_info() ->
  modules:module_info().
