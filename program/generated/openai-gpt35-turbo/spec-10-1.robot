*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Verify Elements as Teacher
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    [Teardown]    Close Browser
    Wait Until Element Is Visible    aria/Login
    Click Element    aria/Login
    Wait Until Element Is Visible    aria/Username
    Input Text    aria/Username    strict
    Wait Until Element Is Visible    aria/Password
    Input Text    aria/Password    pass
    Wait Until Element Is Visible    aria/Login[role="button"]
    Click Element    aria/Login[role="button]
    Wait Until Element Is Visible    aria/My Subjects
    Click Element    aria/My Subjects
    Wait Until Element Is Visible    css:#tea\.mySubjects\.table\.unregisterSubjectButton-0
    Click Element    css:#tea\.mySubjects\.table\.unregisterSubjectButton-0
    Wait Until Element Is Visible    aria/My Exam Dates
    Click Element    aria/My Exam Dates
    Wait Until Element Is Visible    aria/New Exam Dates
    Click Element    aria/New Exam Dates
    Wait Until Element Is Visible    aria/Set Evaluation
    Click Element    aria/Set Evaluation
    Wait Until Element Is Visible    aria/Evaluation Table
    Click Element    aria/Evaluation Table
    Wait Until Element Is Visible    aria/Others' Subjects
    Click Element    aria/Others' Subjects
    Wait Until Element Is Visible    aria/List of All Teachers
    Click Element    aria/List of All Teachers

Open Page and Verify Elements as Student
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    [Teardown]    Close Browser
    Wait Until Element Is Visible    aria/Login
    Click Element    aria/Login
    Wait Until Element Is Visible    aria/Username
    Input Text    aria/Username    orange
    Wait Until Element Is Visible    aria/Password
    Input Text    aria/Password    pass
    Wait Until Element Is Visible    aria/Login[role="button"]
    Click Element    aria/Login[role="button]
    Wait Until Element Is Visible    aria/Other Subjects
    Click Element    aria/Other Subjects