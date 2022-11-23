*** Settings ***
Documentation     Ações para realização de login com e sem sucesso. 

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot

*** Test Cases ***
Realizar login sem informar Email e Senha
    Informo email               ${EMPTY} 
    Informo a senha             ${EMPTY}  
    Clico em ENTRAR               
    Valido mensagem de login   ${SEM_EMAIL}
    Valido mensagem de login   ${SEM_SENHA}
    

Realizar login sem informar Email
    Informo a senha           ${SENHA_VALIDA}
    Clico em ENTRAR               
    Valido mensagem de login  ${SEM_EMAIL}


Realizar login sem informar Senha
    Informo email             ${USUARIO_VALIDO} 
    Clico em ENTRAR               
    Valido mensagem de login  ${SEM_SENHA}


Realizar login com usuário valido e senha inválida
    ${senha_fake}             FakerLibrary.Password 
    Informo email             ${USUARIO_VALIDO}   
    Informo a senha           ${senha_fake} 
    Clico em ENTRAR            
    Valido mensagem de login  ${INFO_ERRADA}


Realizar login com email não cadastrado e senha válida
    ${email_fake}             FakerLibrary.Email 
    Informo email             ${email_fake}        
    Informo a senha           ${SENHA_VALIDA}
    Clico em ENTRAR                
    Valido mensagem de login  ${INFO_ERRADA}

