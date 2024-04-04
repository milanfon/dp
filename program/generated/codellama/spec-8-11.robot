*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Spec 8 Student
    Open Browser    http://localhost:4680/tbuis/    ${BROWSER}
    Maximize Browser Window

    # Login as a Student
    Click Element    id:header.link.login
    Click Element    id:loginPage.userNameInput
    Input Text    id:loginPage.userNameInput    green
    Click Element    id:loginPage.passwordInput
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit

    Click Element    id:stu.menu.otherExamDates
    Click Element    id:stu.otherExamDates.table.registerButton-2-0
    Element Should Be Visible    id:stu.otherExamDates.successAlert

    Click Element    id:stu.menu.myExamDates
    Element Should Be Visible    xpath://td[text()[contains(.,'Programming in Java')]]

    Close Browser

Spec 8 Teacher
    Open Browser    http://localhost:4680/tbuis/    ${BROWSER}
    Maximize Browser Window

    # Login as a Teacher
    Click Element    id:header.link.login
    Click Element    id:loginPage.userNameInput
    Input Text    id:loginPage.userNameInput    strict
    Click Element    id:loginPage.passwordInput
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit

    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.participantsButton-1-0

    Element Should Be Visible    xpath://td[text()[contains(.,'Mia Orange')]]

    Close Browser