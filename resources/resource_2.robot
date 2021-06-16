*** Settings ***
Documentation     Exercício 2: 
...               Criar uma keyword que gera um e-mail
...               formado por nome_sobrenome_idade@robot.com

*** Variable ***
${NOME}         breno
${SOBRENOME}    alves
${IDADE}        27

*** Keywords ***
Criar um email formado por "${EMAIL}"
  ${RESULT} =   Catenate    SEPARATOR=_   ${NOME}   ${SOBRENOME}    ${IDADE}
  Log To Console    ${RESULT}@robot.com
