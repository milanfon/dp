*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Check Elements as Teacher
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Element Is Visible    aria/Username
    Input Text    aria/Username    strict
    Wait Until Element Is Visible    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Element Is Visible    aria/My Subjects
    Click Element    aria/My Subjects
    Wait Until Element Is Visible    tea.mySubjects.table.unregisterSubjectButton-0
    Click Element    tea.mySubjects.table.unregisterSubjectButton-0
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
    Close Browser

Open Page and Check Elements as Student
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Viewport    width=1501    height=1104    deviceScaleFactor=1    isMobile=false    hasTouch=false    isLandscape=false
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Element Is Visible    aria/Username
    Input Text    aria/Username    orange
    Wait Until Element Is Visible    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Element Is Visible    aria/Other Subjects
    Click Element    aria/Other Subjects
    Close Browser