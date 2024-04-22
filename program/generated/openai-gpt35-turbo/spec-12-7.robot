*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario 1: Teacher View
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Page Contains Element    aria/Username
    Input Text    aria/Username    scatterbrained
    Wait Until Page Contains Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains Element    aria/My Exam Dates
    Click Element    aria/My Exam Dates
    Wait Until Page Contains Element    aria/X[role="button"]
    Click Element    aria/X[role="button"]
    Wait Until Page Contains Element    aria/Set Evaluation
    Click Element    aria/Set Evaluation
    Wait Until Page Contains Element    aria/Evaluation Table
    Click Element    aria/Evaluation Table
    Wait Until Page Contains Element    aria/Subject
    Select From List by Value    aria/Subject    -1
    Click Element    aria/Filter[role="button"]
    Close Browser

Scenario 2: Student View
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Page Contains Element    aria/Username
    Input Text    aria/Username    orange
    Wait Until Page Contains Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains Element    aria/My Exam Dates
    Click Element    aria/My Exam Dates
    Close Browser