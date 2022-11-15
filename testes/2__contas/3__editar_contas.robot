*** Settings ***
Documentation     Ações para testes de adionar e editar contas

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot    Close Browser

*** Test Cases ***
Editar conta com sucesso
    ${contas}          Get Json    contas.json

    Realizar login         
    Verificar se a conta já existe         ${contas["conta_8"]}
    Verificar se a conta já existe         ${contas["conta_10"]}
    Acessar menu        Contas
    Selecionar opção    Adicionar
    Inserir a conta                        ${contas["conta_8"]}
    Verifico a mensagem da conta           ${msg_conta_sucesso}    
    Edito a conta com novo nome            ${contas["conta_8"]}
    Valido se edição teve sucesso          ${contas["conta_8"]}
