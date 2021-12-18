-module(buffer).
-export([recMensagem/4]).
-import(lists,[member/2]).

sleep() ->
	Random = timer:seconds(rand:uniform(5)),
	timer:sleep(Random).

 recMensagem(Lista, Tam_lista_Oxi, Tam_lista_Hid, Tam_Lista_Ag) ->

	 receive

		{Pid ,add_O, Oxigenio} ->

			if 
			   Tam_lista_Oxi < 1 ->
				    io:fwrite("~n ~p recebido de ~p~n Lista: ~p~n",
							  [Oxigenio, Pid, lists:append(Lista,Oxigenio)]),
				   	recMensagem(lists:append(Lista, Oxigenio),Tam_lista_Oxi+1 , Tam_lista_Hid, Tam_Lista_Ag);

			   true ->
					io:fwrite("~n## Oxigenio completo ##~n"),
					recMensagem(Lista, Tam_lista_Oxi, Tam_lista_Hid,Tam_Lista_Ag)
			end;

		{Pid_2 ,add_H, Hidrogenio} ->

		    if					
			    Tam_lista_Hid < 2 ->
					io:fwrite("~n ~p recebido de ~p~n Lista: ~p~n",
								[Hidrogenio, Pid_2, lists:append(Lista,Hidrogenio)]),
					recMensagem(lists:append(Lista, Hidrogenio),Tam_lista_Oxi, Tam_lista_Hid+1, Tam_Lista_Ag);

			   true ->  
					io:fwrite("~n## Hidrogenio completo ##~n"),
					gera_agua(Lista,Tam_lista_Oxi,Tam_lista_Hid,Tam_Lista_Ag),		
					recMensagem(lists:append(Lista, Hidrogenio),Tam_lista_Oxi, Tam_lista_Hid,Tam_Lista_Ag)
			end 
		end.


	 gera_agua(Lista,Tam_lista_Oxi,Tam_lista_Hid,Tam_Lista_Ag) ->

			if 
				Tam_lista_Oxi == 1 ->
					io:fwrite("~n Formando Agua...~n"),
					sleep(),
					io:fwrite("~n## Água formada ##~n"),
					io:fwrite("~n Quantidade de Água: ~p~n",
								[Tam_Lista_Ag+1]),
					recMensagem(Lista,Tam_lista_Oxi-1, Tam_lista_Hid-2,Tam_Lista_Ag+1)
			
			end.

