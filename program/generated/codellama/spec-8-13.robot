*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/
${BROWSER}        Chrome
${DELAY}          0 seconds

*** Test Cases ***
Spec 8 Student
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    green
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=stu.menu.otherExamDates
    Click Button    id=stu.otherExamDates.table.registerButton-2-0
    ${element}=    Get Webelement    id=stu.otherExamDates.successAlert
    Should Be Visible    ${element}
    Click Link    id=stu.menu.myExamDates
    ${element}=    Get Webelement    xpath=//td[contains(text(),'Programming in Java')]
    Should Be Visible    ${element}
    [Teardown]    Close Browser

Spec 8 Teacher
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Input Text    id=loginPage.userNameInput    strict
    Input Text    id=loginPage.passwordInput    pass
    Click Button    id=loginPage.loginFormSubmit
    Click Link    id=tea.menu.myExamDates
    Click Button    id=tea.myExamDates.table.participantsButton-1-0
    ${element}=    Get Webelement    xpath=//td[contains(text(),'Mia Orange')]
    Should Be Visible    ${element}
    [Teardown]    Close Browser