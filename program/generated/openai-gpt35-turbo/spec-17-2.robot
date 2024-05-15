*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          1s

*** Test Cases ***
Teacher View
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Wait Until Element Is Visible    aria/Login
    Click Element    aria/Login
    Wait Until Element Is Visible    aria/Username
    Input Text    aria/Username    pedant
    Wait Until Element Is Visible    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Element Is Visible    aria/Others' Subjects
    Click Element    aria/Others' Subjects
    Wait Until Element Is Visible    #tea\.otherSubjects\.table\.participateButton-3
    Click Element    #tea\.otherSubjects\.table\.participateButton-3
    Wait For Element    tea.otherSubjects.successAlert    visible
    Close Browser

Student View
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Wait Until Element Is Visible    aria/Login
    Click Element    aria/Login
    Wait Until Element Is Visible    aria/Username
    Input Text    aria/Username    yellow
    Wait Until Element Is Visible    aria/Password
    Input Text    aria/Password    pass
    Click Element    aria/Login[role="button"]
    Wait Until Element Is Visible    aria/Other Subjects
    Click Element    aria/Other Subjects
    Wait Until Element Is Visible    #stu\.otherSubjects\.table\.subjectRow-2
    Check Element Text    #stu\.otherSubjects\.table\.subjectRow-2/td[2]    Linear Algebra
    Check Element Text    #stu\.otherSubjects\.table\.subjectRow-2/td[3]    Alice Pedant
    Close Browser