*** Settings ***
Documentation       Aqui se encontram os setups e suites do projeto

Library             SeleniumLibrary

*** Variables ***

${BROWSER}  chrome

*** Keywords ***

Abrir navegador
    Open Browser                browser=${BROWSER}      options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Maximize Browser Window

Fechar navegador
    Close Browser