*** Settings ***
Library           SeleniumLibrary
Documentation     A test suite with two tests

*** Variables ***
${BROWSER}        chrome
${DELAY}          2 seconds

*** Test Cases ***
Student registers for an exam
    Open Browser    http://localhost:4680/tbuis/    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    green
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="stu.otherExamDates.successAlert"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()="Programming in Java"]
    Sleep    ${DELAY}
    Close Browser

Teacher checks list of participants
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[text()="Mia Orange"]
    Sleep    ${DELAY}
    Close Browser
