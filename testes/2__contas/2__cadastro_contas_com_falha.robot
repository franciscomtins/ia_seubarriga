*** Settings ***
Documentation      Ações para testes de cadastro nas contas que apresentarão falha

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Task Setup        Take Screenshot    Close Browser


*** Test Cases ***
Tentar inserir conta sem o nome
    Realizar login         
    Acessar menu        Contas
    Selecionar opção    Adicionar

    ${contas}           Get Json    contas.json
    Inserir a conta     ${contas["conta_2"]}     
   
    Verifico a mensagem da conta    ${msg_conta_sem_nome}  


Tentar inserir conta com nome ja cadastrado    
    ${contas}           Get Json    contas.json
    Verificar se a conta já existe         ${contas["conta_3"]}   

    Acessar menu        Contas
    Selecionar opção    Adicionar

    Inserir a conta     ${contas["conta_3"]}    
    Acessar menu        Contas
    Selecionar opção    Adicionar
    Inserir a conta     ${contas["conta_3"]}   
   
    Verifico a mensagem da conta    ${msg_conta_duplicada} 


Tentar inserir conta com nome ja cadastrado com espaços antes e depois do nome        
    Log    Teste está quebrando no seu Barriga 

    ${contas}           Get Json    contas.json
    Verificar se a conta já existe         ${contas["conta_4"]}   
    Verificar se a conta já existe         ${contas["conta_5"]}   

    Acessar menu        Contas
    Selecionar opção    Adicionar

    Inserir a conta     ${contas["conta_4"]}    
    Acessar menu        Contas
    Selecionar opção    Adicionar
    Inserir a conta     ${contas["conta_5"]}   
   
    Verifico a mensagem da conta    ${msg_conta_duplicada} 


Tentar inserir conta com nome ja cadastrado diferenciando Key Sensitive     
    Log    Teste está quebrando no seu Barriga

    ${contas}           Get Json    contas.json
    Verificar se a conta já existe         ${contas["conta_6"]}   
    Verificar se a conta já existe         ${contas["conta_7"]}  

    Acessar menu        Contas
    Selecionar opção    Adicionar
    
    Inserir a conta     ${contas["conta_6"]}    
    Acessar menu        Contas
    Selecionar opção    Adicionar
    Inserir a conta     ${contas["conta_7"]}   
   
    Verifico a mensagem da conta    ${msg_conta_duplicada} 

