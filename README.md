# Processamento-Paralelo---Erlang

O presente trabalho teve como objetivo desenvolver a solução de um
problema de processos usando a linguagem Erlang. A aplicação deveria simular um
processo de criação de moléculas de hidrogênio e de oxigênio e, quando tivesse os
elementos suficientes, ou seja, dois hidrogênios e um oxigênio e depois de um
tempo entre 10 a 30 segundos para gerar energia suficiente, criar a partícula de
água.


ALGORITMO:
Para a solução do problema, desenvolvemos quatro módulos: main,
hidrogênio, oxigênio e buffer.
Módulo main: Responsável por executar os processos e armazenar seus
PID’s em variáveis para utilizar como parâmetro.

Imagem 01 - Módulo main

![image](https://user-images.githubusercontent.com/63029905/146653734-581a055f-15dc-4be6-bb30-b854cf5bdf8d.png)


Módulo hidrogênio: Responsável atribuir hidrogênio ao módulo buffer. Envia
através de uma mensagem o seu PID atual do processo, a mensagem “add_H” e o
elemento de hidrogênio. Após, ele informa através de um io:format as informações
que foram enviadas, chama também um sleep randômico entre 10 e 30 segundos e
após cai novamente na função.

Imagem 02 - Módulo hidrogênio
![image](https://user-images.githubusercontent.com/63029905/146653740-108a6f06-89de-45e8-8359-d36f95e256be.png)

Módulo oxigênio: Responsável atribuir oxigênio ao módulo buffer. Envia
através de uma mensagem o seu PID atual do processo, a mensagem “add_O” e o
elemento de oxigênio. Após, ele informa através de um io:format as informações
que foram enviadas, chama também um sleep entre 10 e 30 segundos randômico e
após cai novamente na função.

Imagem 03 - Módulo oxigênio
![image](https://user-images.githubusercontent.com/63029905/146653746-0eb209a4-1456-412e-9e4e-ec4fd3c22604.png)


Módulo Buffer: Recebe os parâmetros enviados pelo módulo main, e aguarda
o envio de mensagens através do “receive”.
Ao receber a mensagem com os seguintes parâmetros “{Pid ,add_O,
Oxigenio} ->” , ele cai em uma estrutura de condição, onde primeiramente verifica se
o tamanho da lista de oxigênio está menor que 1, pois só podemos receber 1
oxigênio e por padrão a variável inicia com 0 pois vem como parâmetro do módulo
main.
Caso não esteja completo ele cai na primeira condição e adiciona um novo
oxigênio na lista através do lists:append e também incrementa com 1 a variável
Tam_lista_Oxi.
Caso esteja cheio, ele somente exibe na tela que o oxigênio está cheio e
chama novamente a função recmensagem.

Imagem 04 - Módulo buffer 1
![image](https://user-images.githubusercontent.com/63029905/146653755-3a990f09-f3e6-43d8-82b3-fec6e3eafa26.png)


Ao receber a mensagem com os seguintes parâmetros “{Pid_2 ,add_H,
Hidrogenio} ->” , ele cai em uma estrutura de condição, onde primeiramente verifica
se o tamanho da lista de hidrogênio está menor que 2, pois só podemos receber 2
hidrogênios e por padrão a variável inicia com 0 pois vem como parâmetro do
módulo main.
Caso não esteja completo ele cai na primeira condição e adiciona um novo
hidrogênio na lista através do lists:append e também incrementa com 1 a variável
Tam_lista_Hid.
Caso esteja cheio, ele somente exibe na tela que o hidrogênio está cheio,
chama a função gera_agua() passando os parâmetros de informações do hidrogênio
e oxigênio, e então chama novamente a função recmensagem.

Imagem 05 - Módulo buffer 2
![image](https://user-images.githubusercontent.com/63029905/146653761-ee8942dc-fe7a-4ed3-bdb2-a9edb88f8819.png)

Dentro da função gera_agua, ele cai em uma estrutura de condição onde
somente se verifica se o oxigênio está completo, pois como a função é somente
chamada quando o hidrogênio está cheio, só precisamos mais verificar o próprio
oxigênio.
Caso ele esteja cheio, é formada a água incrementando a variável
Tam_Lista_Ag para podermos ir controlando quantas águas foram criadas, e então
são printadas na tela as mensagens do processo. Antes de retornar da função ele
ainda zera as variáveis de Tam_lista_Oxi, Tam_lista_Hid para poder cair novamente
nas condições acima e gerar novas águas, então esses processos vão sendo
executados recursivamente até serem parados manualmente.

Imagem 06 - Módulo buffer 3
![image](https://user-images.githubusercontent.com/63029905/146653772-719eeef7-7fa0-4161-b4e1-3ae828f7b540.png)


CÓDIGO FONTE:
Para executar a função, basta acessar a página onde está salvo o arquivo atráves do emulador do Erlang,
compilar os 4 módulos com a função c(modulo). Após isso, acessar a função main e
rodar a função “start”, main(start).
