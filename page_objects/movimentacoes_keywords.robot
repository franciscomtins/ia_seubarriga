*** Settings ***
Documentation      keywords de açoes no arquivo de movimentacões
Library            Browser


*** Variables ***
${msg_movimento_sucesso}     Movimentação adicionada com sucesso! 
${msg_data_movi_obrigat}     Data da Movimentação é obrigatório
${msg_data_paga_obrigat}     Data do pagamento é obrigatório
${msg_descricao_obrigat}     Descrição é obrigatório
${msg_interessa_obrigat}     Interessado é obrigatório
${msg_valor_obrigat}         Valor é obrigatório
${msg_valor_numero_obrig}    Valor deve ser um número


*** Keywords ***
seleciono o tipo de movimentação
    [Arguments]              ${validacao}
    Select Options By        id=tipo    text    ${validacao}


seleciono a conta movimentada
    [Arguments]              ${validacao}
    Select Options By        id=conta    text    ${validacao}


seleciono a situação da conta
    [Arguments]    ${validacao}
    Click          xpath=//label[.='${validacao}']


Informo a data de movimentação 
    [Arguments]    ${validacao} 
    Fill Text      id=data_transacao    ${validacao} 


Informo a data de pagamento 
    [Arguments]    ${validacao} 
    Fill Text      id=data_pagamento    ${validacao} 


Informo a descrição
    [Arguments]    ${validacao} 
    Fill Text      id=descricao         ${validacao} 


Informo o interessado
    [Arguments]    ${validacao} 
    Fill Text      id=interessado       ${validacao} 


Informo o valor
    [Arguments]    ${validacao} 
    Fill Text      id=valor             ${validacao} 

Salvo a movimentação e valido a mensagem com sucesso
    Click           css=.btn    
    Get Text        xpath=//div[contains(text(),"${msg_movimento_sucesso}")]


Salvo a movimentação 
    Click           css=.btn 

valido a mensagem da movimentação
    [Arguments]     ${mensagem}
    Get Text        xpath=//div[@role="alert"]//li[contains(text(),"${mensagem}")]


As informações listadas na conta 
    [Arguments]    ${id}    ${info}   ${super_var}  
     
    Wait For Elements State    xpath=//tr[${id}]/td[.='${super_var["descricao"]}']        Visible    30
    Wait For Elements State    xpath=//tr[${id}]/td[.='${super_var["data_pagamento"]}']   Visible    30
    Wait For Elements State    xpath=//tr[${id}]/td[.='${super_var["conta"]}']            Visible    30
    Wait For Elements State    xpath=//tr[${id}]/td[.='${super_var["valor"]}']            Visible    30
    Wait For Elements State    xpath=//tr[${id}]/td[.='${super_var["situacao"]}']         Visible    30