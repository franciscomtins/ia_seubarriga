*** Settings ***
Documentation     Ações para validar informações exibidas no Saldo
Library            Browser

Resource          ../../page_objects/dependencias.robot
Resource          ../../page_objects/preparacoes_ambiente.robot
Resource          ../../page_objects/contas_keywords.robot
Resource          ../../page_objects/movimentacoes_keywords.robot
Resource    ../../page_objects/saldo_keywords.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot    Close Browser


*** Test Cases ***
Validar Saldo com Sucesso
    [Tags]    smoke saldo
    Informo email           ${USUARIO_VALIDO}    
    Informo a senha         ${SENHA_VALIDA}  
    Clico em ENTRAR  
    Confirmo que estou logado no sistema
    Prepara ambiente para saldo
    Acessar menu        Criar Movimentação
    ${movimentacoes}     Get Json    movimentacao_saldo.json
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
    Acessar menu        Home
    ${saldo}           Get Json    saldo.json
    Validar Conta    ${saldo["saldo"]}
    Validar Saldo    ${saldo["saldo"]}
