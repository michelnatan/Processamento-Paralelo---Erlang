-module(hidrogenio). 
-export([gera_hidrogenio/1]).

sleep() ->
	Random = timer:seconds(rand:uniform(10)+20),
	timer:sleep(Random).


gera_hidrogenio(Buffer) ->
		Elements = {hidrogenio},
		R = rand:uniform(tuple_size(Elements)),
		P = [element(R, Elements)], % 3 e lista de produtos
		Hidrogenio = {self(), add_H, P},
		Buffer ! Hidrogenio,
		io:format("~n ~p enviado para o buffer! ~n", [P]),
		sleep(),
	    gera_hidrogenio(Buffer).