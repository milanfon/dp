*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    http://localhost:4680/tbuis/
${browser}    Chrome

*** Test Cases ***
Spec 8 Student
    [Setup]    Open Browser    ${url}    ${browser}
    [Teardown]    Close Browser

    # Student steps
    Input Text    id=loginPage.userNameInput    green
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=stu.menu.otherExamDates
    Click Button    id=stu.otherExamDates.table.registerButton-2-0
    Click Link    id=stu.menu.myExamDates
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert

    # Teacher steps
    Input Text    id=loginPage.userNameInput    strict
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=tea.menu.myExamDates
    Click Button    id=tea.myExamDates.table.participantsButton-1-0
    Wait Until Element Is Visible    xpath=//td[contains(text(), 'Mia Orange')]

Spec 8 Teacher
    [Setup]    Open Browser    ${url}    ${browser}
    [Teardown]    Close Browser

    # Teacher steps
    Input Text    id=loginPage.userNameInput    strict
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=tea.menu.myExamDates
    Click Button    id=tea.myExamDates.table.participantsButton-1-0
    Wait Until Element Is Visible    xpath=//td[contains(text(), 'Mia Orange')]

    # Student steps
    Click Link    id=stu.menu.overview
    Click Link    id=stu.menu.otherExamDates
    Click Button    id=stu.otherExamDates.table.registerButton-2-0
    Click Link    id=stu.menu.myExamDates
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert
    Element Should Contain    xpath=//td    Programming in Java