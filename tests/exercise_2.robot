*** Settings ***
Documentation     Exercício 2: 
...               Criar uma keyword que gera um e-mail
...               formado por nome_sobrenome_idade@robot.com

Resource    ../resources/resource_2.robot

*** Test Case ***
Caso de Teste 1: Argumentos e Retornos
  Criar um email formado por "nome_sobrenome_idade@robot.com"
