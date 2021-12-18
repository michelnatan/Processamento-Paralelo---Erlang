-module(main).
-import(oxigenio,[gera_oxigenio/1]).
-import(hidrogenio,[gera_hidrogenio/1]).
-export([start/0]).



start() ->	
	Pid_buffer = spawn(buffer, recMensagem, [[], 0, 0, 0]),
	Oxigenio_PID_1 = spawn(oxigenio, gera_oxigenio, [Pid_buffer]),
	Hidrogenio_PID_1 = spawn(hidrogenio, gera_hidrogenio, [Pid_buffer]).
stop() ->
    exit(normal).

	
