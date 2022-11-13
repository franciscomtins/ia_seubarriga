*** Settings ***
Documentation      keywords de açoes no arquivo de contas
Library            Browser


*** Variables ***
${msg_conta_sem_nome}     Informe o nome da conta
${msg_conta_duplicada}    Já existe uma conta com esse nome!
${msg_conta_alterada}     Conta alterada com sucesso!
${msg_conta_sucesso}      Conta adicionada com sucesso! 
${msg_conta_removida}     Conta removida com sucesso!   


*** Keywords ***
Selecionar opção
    [Arguments]    ${opcao}
    Click    xpath=//a[.="${opcao}"]

Inserir a conta 
    [Arguments]    ${super_var}
    Fill Text      id=nome         ${super_var["nome"]}
    Click          css=.btn
 
Verifico a mensagem da conta
    [Arguments]     ${mensagem}
    Get Text        xpath=//div[contains(text(),"${mensagem}")]


Removo a conta
    [Arguments]    ${super_var}
    Click          xpath=//td[.='${super_var["nome"]}']/..//a[contains(@href, "/remover")]
    Get Text       xpath=//table/tbody     not contains    '${super_var["nome"]}' 
    

Edito a conta com novo nome
    [Arguments]    ${super_var}
    Click          xpath=//td[.='${super_var["nome"]}']/..//a[contains(@href, "/editar")]

    Wait For Elements State    id=nome    visible    30

    Fill Text     id=nome          ${super_var["nome_novo"]}
    Click         css=.btn


Valido se edição teve sucesso
    [Arguments]    ${super_var}
    Verifico a mensagem da conta        ${msg_conta_alterada}  
    Get Text     xpath=//table/tbody    contains    ${super_var["nome_novo"]}