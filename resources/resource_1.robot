*** Settings ***
Documentation     Exercício Variáveis: 
...               Criação de variáveis, keywords e estrura inicial
...               Robot Framework.

*** Variable ***

# Variável Dicionário
&{DADOS}          
...               Nome=Breno    
...               Sobrenome=Alves     
...               Idade=27
...               Cidade=Recife
...               Estado=PE
...               Pais=Brasil


@{FRUTA}
...               Melancia
...               Banana
...               Maçã
...               Abacaxi
...               Manga

*** Keywords ***

Imprimir na tela os Dados do Usuário
  Log To Console    \nNome: ${DADOS.Nome}
  Log To Console      Sobrenome: ${DADOS.Sobrenome}
  Log To Console      Idade: ${DADOS.Idade}
  Log To Console      Cidade: ${DADOS.Cidade}
  Log To Console      Estado: ${DADOS.Estado}
  Log To Console      País: ${DADOS.Pais}

Imprimir na tela a Lista de Frutas
  Log To Console      \n${FRUTA[0]}
  Log To Console      \n${FRUTA[1]}
  Log To Console      \n${FRUTA[2]}
  Log To Console      \n${FRUTA[3]}
  Log To Console      \n${FRUTA[4]}
