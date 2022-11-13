*** Settings ***
Documentation      keywords de açoes no arquivo de contas
Library            Browser

Resource          dependencias.robot


*** Variables ***
${Movimentacoes_conta}         Carteira  

*** Keywords ***
Prepara ambiente para movimentações
    Acessar menu        Resumo Mensal
    
    FOR    ${COUNT}    IN RANGE    1    5
        Click    xpath=(//a[contains(@href, "/remover")])[1]
        Wait For Elements State    xpath=//div[contains(text(),"Movimentação removida com sucesso!")]       
    END

Verificar se a conta já existe
    [Arguments]    ${conta}
    Acessar menu        Contas
    Selecionar opção    Listar

    ${conta_listada}=    Run Keyword And Return Status    Get Text     xpath=//tbody/tr/td[contains(text(),"${conta}")]    ==    ${conta}    
    Log    ${conta_listada}
    
    IF    "${conta_listada}"   
         Click    xpath=(//a[contains(@href, "/remover")])[1]
    END

