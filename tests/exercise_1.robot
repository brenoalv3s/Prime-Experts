*** Settings ***
Documentation     Exercício Variáveis: 
...               Criação de variáveis, keywords e estrura inicial
...               Robot Framework.

Resource      ../resources/resource_1.robot

*** Test Cases ***
Caso de Teste 1: Dados Pessoais
  Imprimir na tela os Dados do Usuário 

Caso de Teste 2: Lista de Frutas
  Imprimir na tela a Lista de Frutas
