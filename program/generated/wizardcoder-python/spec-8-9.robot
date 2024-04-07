*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome
${DELAY}    0.5s

*** Test Cases ***
Scenario: Student
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    green
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherExamDates
    Click Element    id:stu.otherExamDates.table.registerButton-2-0
    Click Element    id:stu.menu.myExamDates
    Wait Until Element Is Visible    id:stu.otherExamDates.successAlert    ${DELAY}
    ${table}    Get Table Cell    id:stu.myExamDates.table    xpath://*[contains(text(), 'Programming in Java')]
    Should Be Equal    ${table[0][0]}[text]    Programming in Java
    Close Browser