*** Settings ***
Documentation       Aqui se encontram todas as variáveis do projeto

*** Variables ***

${PRODUTO}  Blouse
${NAOEXISTENTE}   itemNãoExistente  
&{XPATHS}       # Da keyword de preenchimento de dados obrigatórios
...         pNome=//*[@id="customer_firstname"]
...         uNome=//*[@id="customer_lastname"]
...         endereço=//*[@id="address1"]
...         cidade=//*[@id="city"]
...         senha=//*[@id="passwd"]
...         codPostal=//*[@id="postcode"]
...         telefone=//*[@id="phone_mobile"]
...         outroEmail=//*[@id="alias"]
...         botãoSubmit=//*[@id="submitAccount"]
