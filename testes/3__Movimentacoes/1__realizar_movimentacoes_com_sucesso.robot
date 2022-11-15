*** Settings ***
Documentation     Ações para testes de movimentações com sucesso, com tipo Receita e Despesa, com situação 
...               Pago e Pendente. Atualmente a conta exige data de pagamento mesmo para conta com situação Pendente. 

Resource          ../../page_objects/dependencias.robot

Suite Setup       Iniciar sessao
Suite Teardown    Take Screenshot    Close Browser

*** Test Cases ***
Inserir movimentações com sucesso

    Realizar login 
    Prepara ambiente para movimentações
    Acessar menu        Criar Movimentação

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