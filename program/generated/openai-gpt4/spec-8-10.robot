*** Settings ***
Documentation     This test suite validates student exam date registrations and teacher views on university system.
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}         http://localhost:4680/tbuis/login
${STUDENT_USERNAME}  green
${STUDENT_PASSWORD}  pass
${TEACHER_USERNAME}  strict
${TEACHER_PASSWORD}  pass

*** Test Cases ***
Student Registers For Exam Date
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${STUDENT_PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert    5s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Wait Until Page Contains Element    xpath=//td[text()="Programming in Java"]    5s
    Close Browser

Teacher Verifies Student Registration
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${TEACHER_PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Wait Until Page Contains    Mia Orange    5s
    Close Browser