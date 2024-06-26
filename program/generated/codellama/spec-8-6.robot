*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
spec 8 student
    [Setup]  Open Browser  ${EMPTY}  Chrome
    Go To  http://localhost:4680/tbuis/
    Click Element  id:header.link.login
    Click Element  id:loginPage.userNameInput
    Input Text  id:loginPage.userNameInput  green
    Click Element  id:loginPage.passwordInput
    Input Text  id:loginPage.passwordInput  pass
    Click Element  id:loginPage.loginFormSubmit
    Click Element  id:stu.menu.otherExamDates
    Click Element  id:stu.otherExamDates.table.registerButton-2-0
    Element Should Be Visible  id:stu.otherExamDates.successAlert
    Click Element  id:stu.menu.myExamDates
    Element Should Be Visible  xpath://td[text()='Programming in Java']
    [Teardown]  Close Browser

spec 8 teacher
    [Setup]  Open Browser  ${EMPTY}  Chrome
    Go To  http://localhost:4680/tbuis/
    Click Element  id:header.link.login
    Click Element  id:loginPage.userNameInput
    Input Text  id:loginPage.userNameInput  strict
    Click Element  id:loginPage.passwordInput
    Input Text  id:loginPage.passwordInput  pass
    Click Element  id:loginPage.loginFormSubmit
    Click Element  id:tea.menu.myExamDates
    Click Element  id:tea.myExamDates.table.participantsButton-1-0
    Element Should Be Visible  xpath://td[text()='Mia Orange']
    [Teardown]  Close Browser