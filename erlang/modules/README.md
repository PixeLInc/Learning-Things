## Modules & Such
  Note: All statements **MUST** end with a terminator/period ( . )\
  If it doesn't, it won't compile or if you're in ERL then it will just sit and wait for you to type it.

  From what I've seen and tried, variables must start with an uppercase letter\
  Like so:
  ```
  Test = "rawr"
    ^ This will compile and work
  test = "rawr"
    ^ This will not compile nor work
  ```
  All files & such must start with
    `-module(ModuleName).`
  and you also need to export all the functions you want to use
  ```erlang
  -export([add/2]).

  add(X, Y) ->
    X + Y.
  ```
  If you don't, you can't use them.

  To compile, go into ERL:\
    ``c(ModuleName, [opts] / []).``\
  or, you can do:\
    ``compile:file(ModuleName, [opts] / []).``\
  or at the top of your file so that the user doesn't need to touch anything:\
    ``-compile([opts] / []).``

  You can use options (opts). I represent this by `[opts] / []` meaning that it defaults to not needing anything and can be left blank.
  This is not the syntax for it, if you can even do it I dont think

  You define a function by doing:
  ```
  function_name(params in uppercase) ->
    function body. (end terminator)
   ```
  Example:
  ```erlang
  add(X, Y) ->
    X + Y.
   ```

  Looks as if it returns the last statement just like in Ruby and Elixir and such.
  No idea if there are early returns, I'd assume not though.

  You call functions from modules by:
    ``ModuleName:FunctionName/X.``\
    __(X referring to the number of parameters it needs)__\
  For example:\
    ``modules:add(2, 2).``

  You can also look at info about the module by doing:\
    ``ModuleName:module_info().``

  For more examples, see `modules.erl`