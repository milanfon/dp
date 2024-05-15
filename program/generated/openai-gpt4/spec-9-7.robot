*** Settings ***
Documentation     Verify specific elements after performing actions from a JSON recording.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${INITIAL_URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}      http://localhost:4680/tbuis/login
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${MY_EXAM_DATES_URL}       http://localhost:4680/tbuis/student-view/myExamDates
${USERNAME}       orange
${PASSWORD}       pass

*** Test Cases ***
Verify Elements After JSON Recording Actions
    Open Browser    ${INITIAL_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Wait Until Page Contains    Login Page    10s    url=${LOGIN_URL}
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Wait Until Page Contains    Student Overview    10s    url=${STUDENT_OVERVIEW_URL}
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Wait Until Page Contains    My Exam Dates    10s    url=${MY_EXAM_DATES_URL}
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="stu.myExamDates.participantsModal.title"]
    Element Should Contain    xpath=//td    Benjamin Green
    Element Should Contain    xpath=//td    Mia Orange
    Element Should Contain    xpath=//td    Charlotte Purple
    Element Should Contain    xpath=//td    Isabella Yellow
    Close Browser