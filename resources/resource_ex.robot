*** Settings ***
Documentation     Exemplo: Criação de variáveis, keywords e estrura inicial
...               Robot Framework.

*** Variable ***
#Variável Simples
${NOME}           Breno Alves

# Variável Dicionário
&{DADOS}          
...               Nome=Breno    
...               Sobrenome=Alves     
...               Idade=27

# Variável Lista
@{SKILLS}         
...               Robot Framework     
...               JavaScript    
...               NodeJs

*** Keywords ***

Imprimir na tela o "${FULLNAME}" do usuário
  Log To Console      ${NOME}

Imprimir na tela o "${DICTIONARY}"
  Log To Console      ${DADOS}

Imprimir na tela a lista de "${LIST}" do usuário
  Log To Console      ${SKILLS}