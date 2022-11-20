*** Settings ***
Documentation      keywords de açoes no arquivo de login
Library            Browser


## Mensagens tentativa de login
*** Variables ***
${SEM_EMAIL}        Email é um campo obrigatório
${SEM_SENHA}        Senha é um campo obrigatório    
${INFO_ERRADA}      Problemas com o login do usuário  


*** Keywords ***
Informo email 
    [Arguments]      ${email}      
    Fill Text        id=email      ${email}
    

Informo a senha    
    [Arguments]      ${senha}
    Fill Text        id=senha      ${senha}


Clico em ENTRAR
    Click    css=.btn


Confirmo que estou logado no sistema
    Wait For Elements State       xpath=//a[.='Sair']    visible    30


Realizo logout
    Click    xpath=//a[.='Sair']


Valido mensagem de login
    [Arguments]     ${mensagem}
    Get Text        css=.body-index    contains    ${mensagem}    

Realizar login
    Informo email      ${USUARIO_VALIDO}
    Informo a senha    ${SENHA_VALIDA} 
    Clico em ENTRAR  
    Confirmo que estou logado no sistema


