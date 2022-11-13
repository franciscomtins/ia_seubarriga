*** Settings ***
Documentation     Ações para testes de movimentações com tipo Receita e Despesa com falha

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot    Close Browser

*** Test Cases ***
Inserir movimentações sem informar dados obrigatórios

    Realizar login         
    Acessar menu        Criar Movimentação

    ${movimentacoes}     Get Json    movimentacoes_falha.json   
    FOR    ${elemento}   IN          @{movimentacoes}

        seleciono o tipo de movimentação     ${elemento["tipo_movimentacao"]}
        Informo a data de movimentação       ${elemento["data_movimentacao"]}   
        Informo a data de pagamento          ${elemento["data_pagamento"]}  
        Informo a descrição                  ${elemento["descricao"]} 
        Informo o interessado                ${elemento["interessado"]} 
        Informo o valor                      ${elemento["valor"]} 
        seleciono a conta movimentada        ${elemento["conta"]}
        seleciono a situação da conta        ${elemento["situacao"]}  

        Salvo a movimentação 
        valido a mensagem da movimentação    ${msg_data_movi_obrigat}    
        valido a mensagem da movimentação    ${msg_data_paga_obrigat}    
        valido a mensagem da movimentação    ${msg_descricao_obrigat}    
        valido a mensagem da movimentação    ${msg_interessa_obrigat}    
        valido a mensagem da movimentação    ${msg_valor_obrigat}        
        valido a mensagem da movimentação    ${msg_valor_numero_obrig} 

    END