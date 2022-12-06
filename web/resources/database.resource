*** Settings ***
Documentation    Gernciando a massa de testes atraves do banco de dados

Library    DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2
    ...                    kbszlnqf
    ...                    kbszlnqf
    ...                    4N-L5eOmRKFvatNBbdd7-Zwis8RUImN1
    ...                    babar.db.elephantsql.com
    ...                    5432

Select Student Where Email
    [Arguments]            ${email}

    ${query}        Set Variable
    ...             SELECT * FROM public.students WHERE email = '${email}';

    ${result}       Query           ${query}

    [return]        ${result}[0]



Delete Enroll By Email
    [Arguments]           ${email}

    ${user}               Select Student Where Email    ${email}

    ${query}              Set Variable
    ...                   DELETE FROM public.enrollments WHERE student_id = '${user}[0]';

    Execute Sql String    ${query}

Delete Student By Email
    [Arguments]            ${email}

    ${query}       Set Variable
    ...            DELETE FROM public.students WHERE email = '${email}';

    Execute SQL String     ${query}

# Helpers
Reset Student
    [Arguments]                   ${email}
    
    Connect To Postgres
    Delete Student By Email        ${email}
    Disconnect From Database
