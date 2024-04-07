*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${delay}  3s
${url}    http://localhost:4680/tbuis/
${browser}    Chrome

*** Test Cases ***
spec 8 student
    Open Browser    ${url}    ${browser}
    Input Text    id:loginPage.userNameInput    green
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.otherExamDates
    Click Element    id:stu.otherExamDates.table.registerButton-2-0
    Click Element    id:stu.menu.myExamDates
    Element Should Be Visible    id:stu.otherExamDates.successAlert
    Element Should Be Visible    xpath://*[contains(text(), 'Programming in Java')]
    Close Browser

spec 8 teacher
    Open Browser    ${url}    ${browser}
    Input Text    id:loginPage.userNameInput    strict
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.participantsButton-1-0
    Element Should Be Visible    xpath://td[contains(text(), 'Mia Orange')]
    Close Browser