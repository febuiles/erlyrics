-module(parser).
-export([get_lyrics/2]).

get_lyrics(Artist, Title) ->
    [Content|_T] = get_textarea_content(Artist, Title),
    case re:run(Content, "lyrics>(?<LYRIC>.*?)&lt", [dotall, {capture, ["LYRIC"], list}]) of
        { match, Captures } -> io:format("~s", [hd(Captures)]);
        nomatch -> "No Matches"
    end.

get_textarea_content(Artist, Title) ->
    Text = wikia:get_wikia_content(Artist, Title),
    case re:run(Text, "wpTextbox1.*?>(.*?)</textarea>", [dotall, {capture, all, list}]) of
        { match, Captures } -> tl(Captures);
        nomatch -> "No Matches"
    end.

