*** Settings ***
Documentation     Ações para realização de login com e sem sucesso. 

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot

*** Test Cases ***
Realizar login com sucesso
    [Tags]    smoke   

    Informo email           ${USUARIO_VALIDO}    
    Informo a senha         ${SENHA_VALIDA}  
    Clico em ENTRAR  
    Confirmo que estou logado no sistema
    Realizo logout