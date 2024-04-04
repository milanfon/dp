
*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
student
    Open Browser  ${URL}  ${BROWSER}
    Wait Until Page Contains  ${LOGIN}
    Click Element  ${LOGIN}
    Wait Until Page Contains  ${USERNAME}
    Input Text  ${USERNAME}  ${USERNAME_VALUE}
    Wait Until Page Contains  ${PASSWORD}
    Input Text  ${PASSWORD}  ${PASSWORD_VALUE}
    Click Element  ${LOGIN_BUTTON}
    Wait Until Page Contains  ${OTHER_EXAM_DATES}
    Click Element  ${OTHER_EXAM_DATES}
    Wait Until Page Contains  ${EXAM_DATE_BUTTON}
    Click Element  ${EXAM_DATE_BUTTON}
    Wait Until Page Contains  ${SUCCESS_ALERT}
    Click Element  ${MY_EXAM_DATES}
    Wait Until Page Contains  ${TD_TEXT}
    ${TEXT}  Get Text  ${TD_TEXT}
    Log  ${TEXT}
    ${TEXT_EXPECTED}  Set Variable  Programming in Java
    Should Be Equal  ${TEXT}  ${TEXT_EXPECTED}
    Close Browser

teacher
    Open Browser  ${URL}  ${BROWSER}
    Wait Until Page Contains  ${LOGIN}
    Click Element  ${LOGIN}
    Wait Until Page Contains  ${USERNAME}
    Input Text  ${USERNAME}  ${USERNAME_TEACHER}
    Wait Until Page Contains  ${PASSWORD}
    Input Text  ${PASSWORD}  ${PASSWORD_TEACHER}
    Click Element  ${LOGIN_BUTTON}
    Wait Until Page Contains  ${MY_EXAM_DATES}
    Click Element  ${MY_EXAM_DATES}
    Wait Until Page Contains  ${PARTICIPANTS}
    Click Element  ${PARTICIPANTS}
    Wait Until Page Contains  ${TD_TEXT}
    ${TEXT}  Get Text  ${TD_TEXT}
    Log  ${TEXT}
    ${TEXT_EXPECTED}  Set Variable  Mia Orange
    Should Be Equal  ${TEXT}  ${TEXT_EXPECTED}
    Close Browser

*** Variables ***
${URL}  http://localhost:4680/tbuis/
${BROWSER}  Chrome
${LOGIN}  xpath=//*[@id="header.link.login"]
${LOGIN_BUTTON}  xpath=//*[@id="loginPage.loginFormSubmit"]
${USERNAME}  xpath=//*[@id="loginPage.userNameInput"]
${USERNAME_VALUE}  green
${USERNAME_TEACHER}  strict
${PASSWORD}  xpath=//*[@id="loginPage.passwordInput"]
${PASSWORD_VALUE}  pass
${PASSWORD_TEACHER}  pass
${OTHER_EXAM_DATES}  xpath=//*[@id="stu.menu.otherExamDates"]
${EXAM_DATE_BUTTON}  xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
${SUCCESS_ALERT}  xpath=//*[@id="stu.otherExamDates.successAlert"]
${MY_EXAM_DATES}  xpath=//*[@id="stu.menu.myExamDates"]
${PARTICIPANTS}  xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
${TD_TEXT}  xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]/../../..//td
