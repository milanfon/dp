*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}           1s

*** Test Cases ***
Open Page and Execute Teacher Steps
    Open Browser    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Navigate to    http://localhost:4680/tbuis/index.jsp
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Page Contains Element    aria/Username
    Input Text    aria/Username    strict
    Wait Until Page Contains Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains Element    aria/My Subjects
    Click Element    aria/My Subjects
    Wait Until Page Contains Element    tea.mySubjects.table.unregisterSubjectButton-0
    Click Element    tea.mySubjects.table.unregisterSubjectButton-0
    Wait Until Page Contains Element    aria/My Exam Dates
    Click Element    aria/My Exam Dates
    Wait Until Page Contains Element    aria/New Exam Dates
    Click Element    aria/New Exam Dates
    Wait Until Page Contains Element    aria/Set Evaluation
    Click Element    aria/Set Evaluation
    Wait Until Page Contains Element    aria/Evaluation Table
    Click Element    aria/Evaluation Table
    Wait Until Page Contains Element    aria/Others' Subjects
    Click Element    aria/Others' Subjects
    Wait Until Page Contains Element    aria/List of All Teachers
    Click Element    aria/List of All Teachers
    Close Browser

Log in as a student and Execute Student Steps
    Open Browser    chrome
    Maximize Browser Window
    Set Viewport    1501    1104
    Navigate to    http://localhost:4680/tbuis/index.jsp
    Wait Until Page Contains Element    aria/Login
    Click Element    aria/Login
    Wait Until Page Contains Element    aria/Username
    Input Text    aria/Username    orange
    Wait Until Page Contains Element    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Page Contains Element    aria/Other Subjects
    Click Element    aria/Other Subjects
    Close Browser