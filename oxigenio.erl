-module(oxigenio). 
-export([gera_oxigenio/1]).

sleep() ->
	Random = timer:seconds(rand:uniform(10)+20),
	timer:sleep(Random).

gera_oxigenio(Buffer) ->
        Elements = {oxigenio},
		R = rand:uniform(tuple_size(Elements)), 
		P = [element(R, Elements)], 
		Oxigenio = {self(), add_O, P},
		Buffer ! Oxigenio,
		io:format("~n ~p enviado para o buffer! ~n", [P]),
		sleep(),
	    gera_oxigenio(Buffer).

