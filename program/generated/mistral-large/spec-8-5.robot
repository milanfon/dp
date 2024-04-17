*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        http://localhost:4680/tbuis/
${USERNAME}    green
${PASSWORD}    pass
${TEACHER_USERNAME}    strict

*** Test Cases ***
Student Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Student
    Click Element    xpath://*[@id="stu.menu.otherExamDates"]
    Click Element    xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Page Contains Element    xpath://*[@id="stu.otherExamDates.successAlert"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains Element    xpath://td[text()="Programming in Java"]
    Close Browser

Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Teacher
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Wait Until Page Contains Element    xpath://td[text()="Mia Orange"]
    Close Browser

*** Keywords ***
Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Password    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Input Password    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]