*** Settings ***
Library     AppiumLibrary

Test Setup          Abrir o aplicativo
Test Teardown       Fechar o aplicativo

*** Keywords ***
Abrir o aplicativo
  Open Applicatiion         http://localhost:4723/wd/hub
  ...                       automationName=Ui      