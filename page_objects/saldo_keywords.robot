*** Settings ***
Documentation      keywords de açoes no arquivo de Saldo
Library            Browser


*** Keywords ***
Validar Conta
    [Arguments]     ${conta}
    Get Text        xpath=//td[contains(text(),"${conta["conta"]}")]

Validar Saldo
    [Arguments]    ${saldo}
    Get Text    xpath=//td[contains(text(),"${saldo["saldoCalculado"]}")]