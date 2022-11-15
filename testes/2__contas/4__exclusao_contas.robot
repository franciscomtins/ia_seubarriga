*** Settings ***
Documentation     Ações para testes de adionar e excluir contas

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot    Close Browser

*** Test Cases ***
Excluir conta com sucesso
    ${contas}          Get Json    contas.json

    Realizar login               
    Verificar se a conta já existe         ${contas["conta_9"]}
    Acessar menu        Contas
    Selecionar opção    Adicionar
    Inserir a conta                        ${contas["conta_9"]}
    Verifico a mensagem da conta           ${msg_conta_sucesso}    
    Removo a conta                         ${contas["conta_9"]}
    Verifico a mensagem da conta           ${msg_conta_removida}  

