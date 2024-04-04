*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/
${BROWSER}        Chrome

*** Test Cases ***
Spec 8 Student
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    green
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=stu.menu.otherExamDates
    Click Button    id=stu.otherExamDates.table.registerButton-2-0
    Page Should Contain Element    id=stu.otherExamDates.successAlert
    Click Link    id=stu.menu.myExamDates
    Page Should Contain Element    xpath=//td[text()='Programming in Java']
    [Teardown]    Close Browser

Spec 8 Teacher
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    strict
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=tea.menu.myExamDates
    Click Button    id=tea.myExamDates.table.participantsButton-1-0
    Page Should Contain Element    xpath=//td[text()='Mia Orange']
    [Teardown]    Close Browser