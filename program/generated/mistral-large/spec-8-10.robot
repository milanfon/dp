*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://localhost:4680/tbuis/
${USERNAME}    green
${PASSWORD}    pass

*** Test Cases ***
Student View Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Student
    Click Element    xpath://a[contains(@id, 'stu.menu.otherExamDates')]
    Click Element    xpath://button[contains(@id, 'stu.otherExamDates.table.registerButton-2-0')]
    Wait Until Page Contains Element    xpath://*[@id='stu.otherExamDates.successAlert']    10s
    Click Element    xpath://a[contains(@id, 'stu.menu.myExamDates')]
    Wait Until Page Contains Element    xpath://td[text()='Programming in Java']    10s
    Close Browser

Teacher View Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Teacher
    Click Element    xpath://a[contains(@id, 'tea.menu.myExamDates')]
    Click Element    xpath://button[contains(@id, 'tea.myExamDates.table.participantsButton-1-0')]
    Wait Until Page Contains Element    xpath://td[text()='Mia Orange']    10s
    Close Browser

*** Keywords ***
Login As Student
    Click Element    xpath://a[contains(@id, 'header.link.login')]
    Input Text    xpath://input[contains(@id, 'loginPage.userNameInput')]    ${USERNAME}
    Input Text    xpath://input[contains(@id, 'loginPage.passwordInput')]    ${PASSWORD}
    Click Element    xpath://button[contains(@id, 'loginPage.loginFormSubmit')]

Login As Teacher
    Click Element    xpath://a[contains(@id, 'header.link.login')]
    Input Text    xpath://input[contains(@id, 'loginPage.userNameInput')]    strict
    Input Text    xpath://input[contains(@id, 'loginPage.passwordInput')]    pass
    Click Element    xpath://button[contains(@id, 'loginPage.loginFormSubmit')]