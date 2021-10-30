*** Settings ***
Documentation       Aqui se encontram todas as keywords do projeto

Library             SeleniumLibrary
Library             String
Library             FakerLibrary    locale=en_US

*** Variables ***
${URL}      http://automationpractice.com/index.php

*** Keywords ***

Dado que o cliente entre na página home do site
    Go To                           ${URL}
    Title Should Be                 My Store
    Wait Until Element Is Visible   search_block_top

Quando digitar o '${PRODUTO}' no campo de pesquisa
    Wait Until Element Is Visible   id=search_query_top
    Input Text                      id=search_query_top     ${PRODUTO}

E clicar no botão pesquisar
    Wait Until Element Is Visible   //*[@id="searchbox"]/button
    Click Element                   //*[@id="searchbox"]/button

Então deve-se conferir que o produto ${PRODUTO} foi listado no site
    Wait Until Element Is Visible       //*[@id="center_column"]
    Title Should Be                     Search - My Store
    Page Should Contain Image           http://automationpractice.com/img/p/7/7-home_default.jpg

Quando o nome do produto "${NAOEXISTENTE}" for digitado no campo de pesquisa
    Wait Until Element Is Visible       id=search_query_top
    Input Text                          id=search_query_top     ${NAOEXISTENTE}

Então deve-se conferir a mensagem "No results were found for your search "${NAOEXISTENTE}""
    Wait Until Element Is Visible       //*[@id="center_column"]
    Element Text Should Be              //*[@id="center_column"]/p      No results were found for your search "${NAOEXISTENTE}"

Quando passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Wait Until Element Is Visible       //*[@id="block_top_menu"]/ul/li[1]/a
    Mouse Over                          //*[@id="block_top_menu"]/ul/li[1]/a

E clicar na sub categoria "Summer Dresses"
    Wait Until Element Is Visible       //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Click Element                       //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Deve-se conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    Wait Until Element Is Visible       //*[@id="columns"]/div[1]
    Title Should Be                     Summer Dresses - My Store
    Wait Until Element Is Visible       //*[@id="center_column"]/ul

Quando clicar em "Sign in"
    Wait Until Element Is Visible       //*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Click Element                       //*[@id="header"]/div[2]/div/div/nav/div[1]/a

E informar um e-mail válido
    Wait Until Element Is Visible   //*[@id="email_create"]
    ${EMAIL}                        FakerLibrary.Email
    Set Test Variable               ${EMAIL}
    Input Text                      //*[@id="email_create"]     ${EMAIL}

E clicar em "Create an account"
    Wait Until Element Is Visible   //*[@id="SubmitCreate"]
    Click Element                   //*[@id="SubmitCreate"]

E preencher os dados obrigatórios
# Nome
    Wait Until Element Is Visible   ${XPATHS.pNome}
    ${FNAME}                        FakerLibrary.Name
    Input Text                      ${XPATHS.pNome}                 ${FNAME}
# Último nome
    Wait Until Element Is Visible   ${XPATHS.uNome}
    ${LNAME}                        FakerLibrary.LastName
    Input Text                      ${XPATHS.uNome}                 ${LNAME}
# Endereço
    Wait Until Element Is Visible   ${XPATHS.endereço}
    ${ADRESS}                       FakerLibrary.Address
    Input Text                      ${XPATHS.endereço}             ${ADRESS}
# Cidade
    Wait Until Element Is Visible   ${XPATHS.cidade}
    ${CITY}                         FakerLibrary.City
    Input Text                      ${XPATHS.cidade}                ${CITY}
# Senha
    Wait Until Element Is Visible   ${XPATHS.senha}
    ${PWD}                          FakerLibrary.Password
    Input Password                  ${XPATHS.senha}                 ${PWD}
# Código postal
    Wait Until Element Is Visible   ${XPATHS.codPostal}
    ${POSTALCODE}                   FakerLibrary.Postalcode
    Input Text                      ${XPATHS.codPostal}             ${POSTALCODE}
# País
    Wait Until Element Is Visible   //*[@id="uniform-id_country"]
    Select From List By Value       //*[@id="id_country"]           21  #Único disponível
# Número de telefone
    Wait Until Element Is Visible   ${XPATHS.telefone}
    # ${PHONENUMBER}                  FakerLibrary.Phone Number     <--- Gera um número inconsistente, de vez em quando é recusado
    ${PHONENUMBER}                  FakerLibrary.Random Number
    Input Text                      ${XPATHS.telefone}              ${PHONENUMBER}
# Endereço de email
    Wait Until Element Is Visible   ${XPATHS.outroEmail}
    Input Text                      ${XPATHS.outroEmail}            ${EMAIL}
# Gerar número aleatório para escolher estado
    # ${RANDOMNUMBER}             Generate Random String      2      [NUMBERS]
    # Log To Console              ${RANDOMNUMBER}
    # Faz o número ser de 1 à 50, para escolher o estado
    # FOR     ${I}    IN RANGE    999999
    #     IF  ${RANDOMNUMBER} > 50 or ${RANDOMNUMBER} == 0
    #         ${RANDOMNUMBER}     Generate Random String      2      [NUMBERS]
    #     END
    #     Exit For Loop If    ${RANDOMNUMBER} <= 50 and ${RANDOMNUMBER} != 0
    # END
# Estado
    Wait Until Element Is Visible   //*[@id="uniform-id_state"]
    Select From List By Value       //*[@id="id_state"]             5

E submeter cadastro
    Wait Until Element Is Visible   ${XPATHS.botãoSubmit}
    Click Element                   ${XPATHS.botãoSubmit}

Deve-se conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible   //*[@id="center_column"]/div/div[1]/ul
    Title Should Be                 My account - My Store
