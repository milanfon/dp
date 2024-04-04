*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/
${BROWSER}    Chrome
${DELAY}    5s

*** Test Cases ***
Spec 8 Student
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Contain Element    xpath://*[text()="Programming in Java"]
    [Teardown]    Close Browser

Spec 8 Teacher
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[text()="Mia Orange"]
    [Teardown]    Close Browser