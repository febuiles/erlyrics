-module(parser).
-export([get_lyrics/2]).

get_lyrics(Artist, Title) ->
    Text = wikia:get_wikia_content(Artist, Title),
    case re:run(Text, "lyrics>(?<LYRIC>.*?)&lt", [dotall, {capture, ["LYRIC"], list}]) of
        { match, Captures } -> io:format("~s", [hd(Captures)]);
        nomatch -> "No Matches"
    end.
