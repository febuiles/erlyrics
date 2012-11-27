-module(wikia).
-export([get_wikia_content/2]).

get_wikia_content(Artist, Song) ->
    Url = wikia_url(Artist, Song),
    inets:start(),
    {_Status, {_Line, _Headers, Body}} = httpc:request(Url),
    Body.

wikia_url(Artist, Song) ->
    "http://lyrics.wikia.com/index.php?title="
        ++ formatter:titleize(Artist)
        ++ ":"
        ++ formatter:titleize(Song)
        ++ "&action=edit".
