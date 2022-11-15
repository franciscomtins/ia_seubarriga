*** Settings ***
Documentation     Ações para realização de login com e sem sucesso. 

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot

*** Test Cases ***
Realizar login sem informar Email e Senha
    Insiro as credenciais      ${EMPTY}             ${EMPTY}  
    Clico em ENTRAR               
    Valido mensagem de login   ${SEM_EMAIL}
    Valido mensagem de login   ${SEM_SENHA}
    

Realizar login sem informar Email
    Insiro as credenciais     ${EMPTY}              ${SENHA_VALIDA}
    Clico em ENTRAR               
    Valido mensagem de login  ${SEM_EMAIL}


Realizar login sem informar Senha
    Insiro as credenciais     ${USUARIO_VALIDO}     ${EMPTY}  
    Clico em ENTRAR               
    Valido mensagem de login  ${SEM_SENHA}


Realizar login com usuário valido e senha inválida
    ${senha_fake}             FakerLibrary.Password   
    Insiro as credenciais     ${USUARIO_VALIDO}     ${senha_fake} 
    Clico em ENTRAR            
    Valido mensagem de login  ${INFO_ERRADA}


Realizar login com email não cadastrado e senha válida
    ${email_fake}             FakerLibrary.Email 
    Insiro as credenciais     ${email_fake}         ${SENHA_VALIDA}
    Clico em ENTRAR                
    Valido mensagem de login  ${INFO_ERRADA}

