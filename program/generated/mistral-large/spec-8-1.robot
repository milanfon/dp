*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}         Chrome
${URL}             http://localhost:4680/tbuis/
${USERNAME_STUDENT}    green
${PASSWORD}        pass
${USERNAME_TEACHER}    strict
${ELEMENT_TIMEOUT}    10s

*** Test Cases ***
Student Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Student
    Click Element    xpath://a[contains(@id, 'stu.menu.otherExamDates')]
    Sleep    1s
    Click Element    xpath://button[contains(@id, 'stu.otherExamDates.table.registerButton-2-0')]
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath://a[contains(@id, 'stu.menu.myExamDates')]
    Page Should Contain Element    xpath://td[contains(text(), 'Programming in Java')]
    Close Browser

Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Teacher
    Click Element    xpath://a[contains(@id, 'tea.menu.myExamDates')]
    Sleep    1s
    Click Element    xpath://button[contains(@id, 'tea.myExamDates.table.participantsButton-1-0')]
    Sleep    1s
    Page Should Contain Element    xpath://td[contains(text(), 'Mia Orange')]
    Close Browser

*** Keywords ***
Login As Student
    Input Text    xpath://input[contains(@id, 'loginPage.userNameInput')]    ${USERNAME_STUDENT}
    Input Password    xpath://input[contains(@id, 'loginPage.passwordInput')]    ${PASSWORD}
    Click Element    xpath://button[contains(@id, 'loginPage.loginFormSubmit')]
    Sleep    1s

Login As Teacher
    Input Text    xpath://input[contains(@id, 'loginPage.userNameInput')]    ${USERNAME_TEACHER}
    Input Password    xpath://input[contains(@id, 'loginPage.passwordInput')]    ${PASSWORD}
    Click Element    xpath://button[contains(@id, 'loginPage.loginFormSubmit')]
    Sleep    1s