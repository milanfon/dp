*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario 1: Perform actions as a teacher
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    strict
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/My Subjects
    Click Element    #tea\\.mySubjects\\.table\\.unregisterSubjectButton-0
    Wait Until Element Is Visible    id=tea.mySubjects.successAlert
    Click Element    aria/My Exam Dates
    Check Page    My Exam Dates    Operating Systems
    Click Element    aria/New Exam Dates
    Check Page    New Exam Dates    Operating Systems
    Click Element    aria/Set Evaluation
    Check Page    Set Evaluation    Operating Systems
    Click Element    aria/Evaluation Table
    Check Page    Evaluation Table    Operating Systems
    Click Element    aria/Others' Subjects
    Check Page    Other's Subjects    Operating Systems
    Check Page    List of All Teachers    Operating Systems
    Close Browser

Scenario 2: Perform actions as a student
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    aria/Login
    Click Element    aria/Username
    Input Text    aria/Username    orange
    Click Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Click Element    aria/Other Subjects
    Check Page    Other Subjects    Peter Strict    Operating Systems
    Close Browser