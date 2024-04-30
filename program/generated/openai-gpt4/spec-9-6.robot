*** Settings ***
Documentation     Test scenario based on provided JSON recording
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:4680/tbuis/index.jsp
${LOGIN_PAGE}     http://localhost:4680/tbuis/login
${STUDENT_OVERVIEW_PAGE}    http://localhost:4680/tbuis/student-view/overview
${MY_EXAM_DATES_PAGE}       http://localhost:4680/tbuis/student-view/myExamDates
${USERNAME}       orange
${PASSWORD}       pass

*** Test Cases ***
Open Page And Check Elements
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Wait Until Page Contains    Login Page    10s    url=${LOGIN_PAGE}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Wait Until Page Contains    Student Overview    10s    url=${STUDENT_OVERVIEW_PAGE}
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Wait Until Page Contains    My Exam Dates    10s    url=${MY_EXAM_DATES_PAGE}
    Click Element    xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
    Sleep    1s
    Page Should Contain Element    id=stu.myExamDates.participantsModal.title
    Sleep    1s
    Page Should Contain Element    xpath=//td[contains(text(), "Benjamin Green")]
    Page Should Contain Element    xpath=//td[contains(text(), "Mia Orange")]
    Page Should Contain Element    xpath=//td[contains(text(), "Charlotte Purple")]
    Page Should Contain Element    xpath=//td[contains(text(), "Isabella Yellow")]
    Close Browser