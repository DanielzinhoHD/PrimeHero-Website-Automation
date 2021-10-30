*** Settings ***
Documentation       Aqui se encontram todas os testcases do projeto

# Suite Setup          Abrir navegador    
# Suite Teardown       Fechar navegador
Resource            ../resources/hooks.robot
Resource            ../resources/package.robot

Suite Setup          Abrir navegador    
Suite Teardown       Fechar navegador

*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente
    [Tags]      Test1
    Dado que o cliente entre na página home do site
    Quando digitar o '${PRODUTO}' no campo de pesquisa
    E clicar no botão pesquisar
    Então deve-se conferir que o produto ${PRODUTO} foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]      Test2
    Dado que o cliente entre na página home do site
    Quando o nome do produto "${NAOEXISTENTE}" for digitado no campo de pesquisa
    E clicar no botão pesquisar
    Então deve-se conferir a mensagem "No results were found for your search "${NAOEXISTENTE}""

Caso de Teste 03: Listar Produtos
    [Tags]      Test3
    Dado que o cliente entre na página home do site
    Quando passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    E clicar na sub categoria "Summer Dresses"
    Deve-se conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Cliente
    [Tags]      Test4
    Dado que o cliente entre na página home do site
    Quando clicar em "Sign in"
    E informar um e-mail válido
    E clicar em "Create an account"
    E preencher os dados obrigatórios
    E submeter cadastro
    Deve-se conferir se o cadastro foi efetuado com sucesso