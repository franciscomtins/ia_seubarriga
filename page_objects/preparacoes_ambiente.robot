*** Settings ***
Documentation      keywords de açoes no arquivo de contas
Library            Browser

Resource          dependencias.robot


*** Variables ***
${Movimentacoes_conta}         Carteira  

*** Keywords ***
Prepara ambiente para movimentações
    ${contas}          Get Json    contas.json
    
    Acessar menu        Resumo Mensal

    ${adicionar}=   Set Variable    ${1.0}
    ${contador}=    Get Element Count      xpath=//a[contains(@href, "/remover")]
    ${limite}=      Evaluate    ${adicionar}+${contador}
    Log        ${limite}
    

    ${contem_resumo}=    Run Keyword And Return Status    Get Text    xpath=(//td[.='Movimentos'])[1]    ==    Movimentos

    IF    "${contem_resumo}" == "True"
        FOR    ${COUNT}    IN RANGE    1    ${limite}
            Run Keyword And Ignore Error    Click    xpath=(//a[contains(@href, "/remover")])[1]
            Reload
        END
    ELSE
        Log    Sem resumo a apagar
    END

    Acessar menu                      Contas
    Selecionar opção                  Listar
    Verificar se a conta já existe    ${contas["conta_11"]} 
    Acessar menu                      Contas
    Selecionar opção                  Adicionar
    Inserir a conta                   ${contas["conta_11"]} 

Prepara ambiente para saldo
    ${contas}          Get Json    contas.json
    
    Acessar menu        Resumo Mensal

    ${adicionar}=   Set Variable    ${1.0}
    ${contador}=    Get Element Count      xpath=//a[contains(@href, "/remover")]
    ${limite}=      Evaluate    ${adicionar}+${contador}
    Log        ${limite}
    

    ${contem_resumo}=    Run Keyword And Return Status    Get Text    xpath=(//td[.='Itaú - Movimentação'])[1]    ==    Itaú - Movimentação

    IF    "${contem_resumo}" == "True"
        FOR    ${COUNT}    IN RANGE    1    ${limite}
            Run Keyword And Ignore Error    Click    xpath=(//a[contains(@href, "/remover")])[1]
            Reload
        END
    ELSE
        Log    Sem resumo a apagar
    END

    Acessar menu                      Contas
    Selecionar opção                  Listar
    Verificar se a conta já existe    ${contas["conta_12"]} 
    Acessar menu                      Contas
    Selecionar opção                  Adicionar
    Inserir a conta                   ${contas["conta_12"]} 



Verificar se a conta já existe
    [Arguments]         ${conta}
    Acessar menu        Contas
    Selecionar opção    Listar


    ${adicionar}=   Set Variable    ${1.0}
    ${contador}=    Get Element Count      xpath=//a[contains(@href, "/remover")]
    ${limite}=      Evaluate    ${adicionar}+${contador}


    ${conta_listada}=    Run Keyword And Return Status    Get Text     xpath=//tbody/tr/td[contains(text(),"${conta["nome"]}")]    ==    ${conta["nome"]}
    
    IF    "${conta_listada}" == "True"  
        FOR    ${COUNT}    IN RANGE    1    ${limite}
            Run Keyword And Ignore Error    Click    xpath=(//a[contains(@href, "/remover")])[1]  
            Reload   
        END
    ELSE
        Log    Conta não listada
    END


