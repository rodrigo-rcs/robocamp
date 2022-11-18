*** Settings ***
Documentation    Aqui estão todas as importações

Resource    components/navbar.resource
Resource    components/toast.resource
Resource    pages/login.resource
Resource    pages/enroll.resource

*** Keywords ***
# Helpers
Do Login
    [Arguments]    ${user}

    Go to Login Page
    Fill Credentials    ${user}[email]    ${user}[pass]
    Submit Credentials 
    User Should Be Looged In    ${user}[name]