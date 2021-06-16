*** Settings ***
Documentation     Exemplo: Criação de variáveis, keywords e estrura inicial
...               Robot Framework.

Resource      ../resources/resource_ex.robot

*** Test Cases ***
Caso de Teste 1: Variável Simples
  Imprimir na tela o "Nome Completo" do usuário

Caso de Teste 2: Variável Dicionário
  Imprimir na tela o "Dicionário"

Caso de Teste 3: Variável Lista
  Imprimir na tela a lista de "Skills" do usuário
