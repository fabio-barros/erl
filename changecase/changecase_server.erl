-module(changecase_server).
-export([start/0, loop/0]).

% spawns new processes
start() ->
    spawn(changecase_server, loop, []).

%
loop() ->
    receive
        % pattern matching
        {Client, {Str, uppercase}} ->
            Client ! {self(), string:to_upper(Str)};
        {Client, {Str, lowercase}} ->
            Client ! {self(), string:to_lower(Str)}
    end,
    loop().
