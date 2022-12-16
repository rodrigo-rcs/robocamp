*** Settings ***
Documentation    Representação do componente de notificação

Library    Browser

*** Keywords ***
Ope Notifications
        Click       xpath=(//aside//button)[1]

Notification Should Be
    [Arguments]                ${text}        

    ${elements}                Set Variable                    ${text}

#    Wait For Elements State    css=.scrollbar-container p 
    Wait For Elements State    xpath=//div/p[contains(text(),"${text}")]
    ...                        visible
    ...                        timeout=2

    #Get Text    css=.scrollbar-container p        equal        ${text} 
    Get Text    xpath=//div/p[contains(text(),"${text}")]

Click Notification
    [Arguments]            ${text}
    Click    xpath=//div/p[contains(text(),"${text}")]


Reply Notification
    [Arguments]        ${text}

    Click        xpath=//label[text()="SUA RESPOSTA"]/../textarea
    Fill Text    xpath=//label[text()="SUA RESPOSTA"]/../textarea        ${text}
    Click        css=button >> text=Enviar resposta



