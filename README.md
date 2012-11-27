Erlyrics
====
This is a small Erlang application that fetches lyrics from Wikia Lyrics.

Usage
---
Open `erl`, compile all the files and then call `parser:get_lyrics/2`:

    1> c(parser), c(wikia), c(formatter).   % {ok,formatter}
    2> parser:get_lyrics("Pixies", "Gigantic").

