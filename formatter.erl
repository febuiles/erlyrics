-module(formatter).
-export([titleize/1, capitalize/1, split/1]).

titleize([]) -> [];
titleize(Title) ->
    Words = [ formatter:capitalize(X) || X <- formatter:split(string:strip(Title)) ],
    edoc_lib:escape_uri(string:join(Words, "_")).

capitalize([]) -> [];
capitalize([H|T]) -> [string:to_upper(H) | T].

split([]) -> [];
split(String) -> string:tokens(String, " ").
