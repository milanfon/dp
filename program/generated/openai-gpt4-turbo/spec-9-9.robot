*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${MY_EXAM_DATES_URL}    http://localhost:4680/tbuis/student-view/myExamDates

*** Test Cases ***
Navigate and Verify Element Contents
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Wait Until Element Is Visible    xpath=//*[@id="header.link.login"]
    Click Element    xpath=//*[@id="header.link.login"]
    Location Should Be    ${LOGIN_URL}
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Location Should Be    ${STUDENT_OVERVIEW_URL}
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Location Should Be    ${MY_EXAM_DATES_URL}
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Wait Until Element Is Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Element Text Should Be    xpath=//*[@id="stu.myExamDates.participantsModal.title"]    Participants
    Table Should Contain    xpath=//table    Benjamin Green
    Table Should Contain    xpath=//table    Mia Orange
    Table Should Contain    xpath=//table    Charlotte Purple
    Table Should Contain    xpath=//table    Isabella Yellow
    [Teardown]    Close Browser