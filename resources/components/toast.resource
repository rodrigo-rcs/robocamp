*** Settings ***
Documentation    Representação do componete toast

Library    Browser

*** Keywords ***
Verify Toater
    [Arguments]    ${expeted_message}
    
    Wait For Elements State
    ...    css=.Toastify__toast-body div >> text=${expeted_message}
    ...    visible    5

    Wait For Elements State
    ...    css=.Toastify__toast-body div
    ...    detached    10  