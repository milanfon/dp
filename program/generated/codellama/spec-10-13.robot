*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    Chrome
${DELAY}    0

*** Test Cases ***

Scenario1
    [Setup]    Open Browser    about:blank    ${BROWSER}
    # Teacher
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    id:header.link.login
    Click Element    id:loginPage.userNameInput
    Input Text    id:loginPage.userNameInput    strict
    Click Element    id:loginPage.passwordInput
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.mySubjects
    Click Element    id:tea.mySubjects.table.unregisterSubjectButton-0
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.menu.newExamDates
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.menu.otherSubjects
    Click Element    id:tea.menu.listOfAllTeachers
    # Student
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    id:header.link.login
    Click Element    id:loginPage.userNameInput
    Input Text    id:loginPage.userNameInput    orange
    Click Element    id:loginPage.passwordInput
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherSubjects
    [Teardown]    Close Browser

*** Keywords ***