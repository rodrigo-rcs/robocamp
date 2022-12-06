*** Settings ***
Documentation    Suite de teste de autenticação
...              Administrador deve acessar o portal de gestão da acedemia

Resource    ../resources/base.resource

*** Test Cases ***
Login do Administrador
    Go to Login Page
    Fill Credentials    admin@smartbit.com   qacademy
    Submit Credentials 
    User Should Be Looged In    Admin

Email não cadastrado
    Go to Login Page
    Fill Credentials    404@smartbit.com   qacademy
    Submit Credentials 
    Verify Toater    Suas credenciais são inválidas, por favor tente novamente!

Senha inválida
    Go to Login Page
    Fill Credentials    admin@smartbit.com   abc123  
    Submit Credentials
    Verify Toater    Suas credenciais são inválidas, por favor tente novamente!

Email no formato incorreto
    Go to Login Page
    Fill Credentials    @.com.br    abc123
    Submit Credentials
    Field Type Should Be Email

    Sleep        10

Senha em branco
    Go to Login Page
    Fill Credentials    admin@smartbit.com.br    ${EMPTY}
    Submit Credentials
    Alert Text Should Be    password    A senha é obrigatória

E-mail em branco
    Go to Login Page
    Fill Credentials    ${EMPTY}    abc123
    Submit Credentials
    Alert Text Should Be    email    O e-mail é obrigatório


Email e senha são obrigatórios
    Go to Login Page
    Submit Credentials
    Alert Text Should Be    email    O e-mail é obrigatório
    Alert Text Should Be    password    A senha é obrigatória    

