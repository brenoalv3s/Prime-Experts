*** Settings ***
Documentation     Exercício 2: 
...               Criar uma keyword que gera um e-mail
...               formado por nome_sobrenome_idade@robot.com

*** Variable ***
&{INFO}         
...       nome=breno   
...       sobrenome=alves    
...       idade=27

*** Keywords ***
Criar um email formado por "${EMAIL}"
  ${E-MAIL}   keyword email     ${INFO.nome}    ${INFO.sobrenome}   ${INFO.idade}        
  Log To Console    ${E-MAIL}

keyword email
  [Arguments]   ${NOME}   ${SOBRENOME}    ${IDADE}
  ${RESULT} =   Catenate    SEPARATOR=_   ${NOME}   ${SOBRENOME}    ${IDADE}
  [Return]    ${RESULT}@robot.com