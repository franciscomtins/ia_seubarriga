*** Settings ***
Documentation     Ações para testes de cadastro nas contas que apresentarão sucesso

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot    Close Browser

*** Test Cases ***
Inserir a conta com sucesso
    [Tags]    smoke    
    
    ${contas}          Get Json    contas.json

    Realizar login            
    Verificar se a conta já existe         ${contas["conta_1"]} 
    Acessar menu        Contas
    Selecionar opção    Adicionar
    Inserir a conta                        ${contas["conta_1"]}      
    Verifico a mensagem da conta           ${msg_conta_sucesso}    