*** Settings ***
Documentation       Aqui estarão agrupados os arquivos que compõe o projeto

# Libraries
Library             SeleniumLibrary
Library             String
Library             FakerLibrary    locale=en_US

# Keywords
Resource            ./keywords/keywords_automation.robot

# Cases
Resource            ./pages/variables.robot
