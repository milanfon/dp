*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome

*** Test Cases ***
Spec 8 Student
    [Setup]  Open Browser  about:blank  ${BROWSER}
    Go To  http://localhost:4680/tbuis/
    Click Element  id:header.link.login
    Click Element  id:loginPage.userNameInput
    Input Text  id:loginPage.userNameInput  green
    Click Element  id:loginPage.passwordInput
    Input Text  id:loginPage.passwordInput  pass
    Click Element  id:loginPage.loginFormSubmit
    Click Element  id:stu.menu.otherExamDates
    Click Element  id:stu.otherExamDates.table.registerButton-2-0
    Page Should Contain Element  id:stu.otherExamDates.successAlert
    Click Element  id:stu.menu.myExamDates
    Page Should Contain Element  xpath://td[contains(text(),'Programming in Java')]
    [Teardown]  Close Browser

Spec 8 Teacher
    [Setup]  Open Browser  about:blank  ${BROWSER}
    Go To  http://localhost:4680/tbuis/index.jsp
    Click Element  id:header.link.login
    Click Element  id:loginPage.userNameInput
    Input Text  id:loginPage.userNameInput  strict
    Click Element  id:loginPage.passwordInput
    Input Text  id:loginPage.passwordInput  pass
    Click Element  id:loginPage.loginFormSubmit
    Click Element  id:tea.menu.myExamDates
    Click Element  id:tea.myExamDates.table.participantsButton-1-0
    Page Should Contain Element  xpath://td[contains(text(),'Mia Orange')]
    [Teardown]  Close Browser