*** Settings ***
Documentation      Configurações, dependencias e keywords gerais do projeto

## Librarys importadas
Library    Browser
#Library    DatabaseLibrary
Library    FakerLibrary    locale=pt_BR
Library    OperatingSystem

## Page Objects importadas
Resource   login_keywords.robot
Resource   contas_keywords.robot
Resource   movimentacoes_keywords.robot
Resource   preparacoes_ambiente.robot


## Variáveis globais
*** Variables ***
${URL}             https://seubarriga.wcaquino.me/
${BROWSER}         chromium
${HEADLESS}        false

## Variáveis de uso no sistema
${USUARIO_VALIDO}  %{SB_USUARIO} 
${SENHA_VALIDA}    %{SB_SENHA}


## Keywords globais
*** Keywords ***
Iniciar sessao
   New Browser                 ${BROWSER}                     ${HEADLESS}   
   New Page                    ${URL} 
   Wait For Elements State     xpath=//a[.='Seu Barriga']     visible     30


Acessar menu
    [Arguments]    ${menu}
    Click    xpath=//a[contains(text(),"${menu}")]


Get Json
   [Arguments]          ${nome_arquivo}

   ${arquivo_json}      Get File       ${EXECDIR}/datamodels/${nome_arquivo}
   ${super_var}         Evaluate       json.loads($arquivo_json)        json 

   [return]             ${super_var}
