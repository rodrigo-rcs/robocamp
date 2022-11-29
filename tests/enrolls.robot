*** Settings ***
Documentation    Suite de testes matricula alunos 
...              Administrador uma vez logado consegue matricular alunos na academia

Resource    ../resources/base.resource



*** Test Cases ***
Testando API
    [Tags]    api

    ${admin}     Get Fixture    admin
    ${falcao}    Get Fixture    falcao

 
    
Deve matricular um aluno

    ${admin}    Get Fixture        admin
    ${falcao}  Get Fixture        falcao

    Reset Student     ${falcao}[student][email] 

    ${token}    Get Service Token       ${admin}
    POST New student    ${token}    ${falcao}[student]

    Do Login                ${admin}
    
    Go To Enrolls
    Go To Enrolls Form
    Select Student     ${falcao}[student][name]
    Select Plan        ${falcao}[enroll][plan]
    Fill Start Date
    Submit Enroll Form
    Verify Toater    Matrícula cadastrada com sucesso
  
    
    #${temp}    Get Page Source

    #Log ${temp}