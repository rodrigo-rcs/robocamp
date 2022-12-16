*** Settings ***
Documentation        Suite de testes de recebimento de pedido de ajuda

Resource        ../resources/base.resource

Test Teardown    Take Screenshot


*** Test Cases ***
Deve receber uma notificação de pedido de ajuda
    #1a Pessoa => Admin
    #3a Pessoa => Aluno (João)

    #Dado que tenho um aluno cadastrado

    ${admin}         Get Fixture         admin
    ${joao}          Get Fixture         joao

    Reset Student    ${joao}[student][email]

    ${token}            Get Service Token    ${admin}
    ${student_id}       POST New Student     ${token}    ${joao}[student]

    #Quando esse aluno (João) envia um pedido de ajuda via mobile
    POST Question       ${student_id}    ${joao}[question]

    #Então devo ver uma notificação no painel do adaministrador
    Do Login                  ${admin}
    Ope Notifications
    Notification Should Be    ${joao}[question] 

 
 Deve poder responder um pedido de ajuda

    #Desafio final
    #Prazo: Dia 20/12/2022


    ${admin}         Get Fixture         admin
    ${maria}          Get Fixture        maria

    Reset Student    ${maria}[student][email]

    ${token}            Get Service Token    ${admin}
    ${student_id}       POST New Student     ${token}    ${maria}[student]

    POST Question       ${student_id}    ${maria}[question]

    Do Login                  ${admin}
    Ope Notifications
    Notification Should Be    ${maria}[question]
    #Quando respondo esse pedido
    Click Notification        ${maria}[question]
    Reply Notification        ${maria}[answer]
    
    #Então devo ver uma mensagem de sucesso 
    Verify Toater    Resposta enviada com sucesso
