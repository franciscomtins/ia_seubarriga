*** Settings ***
Documentation     Ações para validar informações exibidas no Resumo Mensal

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot    Close Browser

*** Test Cases ***
Inserir movimentações com sucesso

    Realizar login    
    Prepara ambiente para movimentações
    Acessar menu        Criar Movimentação

    ## se eu tivesse acesso ao banco, essas informações seriam feitas via insert e não keyword
    ${movimentacoes}     Get Json    movimentacoes.json   
    FOR    ${elemento}   IN          @{movimentacoes}

        seleciono o tipo de movimentação     ${elemento["tipo_movimentacao"]}
        Informo a data de movimentação       ${elemento["data_movimentacao"]}   
        Informo a data de pagamento          ${elemento["data_pagamento"]}  
        Informo a descrição                  ${elemento["descricao"]} 
        Informo o interessado                ${elemento["interessado"]} 
        Informo o valor                      ${elemento["valor"]} 
        seleciono a conta movimentada        ${elemento["conta"]}
        seleciono a situação da conta        ${elemento["situacao"]}

        Salvo a movimentação e valido a mensagem com sucesso
    END

    ${resumo}     Get Json    resumo_mensal.json

    Acessar menu        Resumo Mensal

    As informações listadas na conta     1    devem ser    ${resumo['movimentacao_1']}           
    As informações listadas na conta     2    devem ser    ${resumo['movimentacao_2']}     
    As informações listadas na conta     3    devem ser    ${resumo['movimentacao_3']}           
    As informações listadas na conta     4    devem ser    ${resumo['movimentacao_4']}     

