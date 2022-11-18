*** Settings ***
Documentation    Suite de testes matricula alunos 
...              Administrador uma vez logado conseGue matricular alunos na academia

Resource    ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    #Falcão Não mexer
    #Smart
    #11/10/2022

    ${admin}    Create Dictionary
    ...        name=Admin
    ...        email=admin@smartbit.com
    ...        pass=qacademy

    Do Login   ${admin}
    
    Go To Enrolls
    Go To Enrolls Form
    Select Student    Falcão Não mexer
    Select Plan       Smart
    Fill Start Date   
    Sleep    10
    Save
    Verify Toater    Matrícula cadastrada com sucesso

    
    #${temp}    Get Page Source

    #Log ${temp}