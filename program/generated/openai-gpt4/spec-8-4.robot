*** Settings ***
Documentation     Validates the registration for an exam date and checks for specific elements across multiple pages.
Library           SeleniumLibrary

*** Variables ***
${STUDENT_LOGIN_URL}    http://localhost:4680/tbuis/login
${TEACHER_LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_USERNAME}     green
${TEACHER_USERNAME}     strict
${PASSWORD}             pass

*** Test Cases ***
Student Registers For An Exam Date And Verifies
    Open Browser    ${STUDENT_LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Student Logs In    ${STUDENT_USERNAME}    ${PASSWORD}
    Student Registers For Exam Date
    Verify Success Alert On Other Exam Dates
    Verify Exam Date Presence In My Exam Dates
    Close Browser

Teacher Checks For Mia Orange In Participants
    Open Browser    ${TEACHER_LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Teacher Logs In    ${TEACHER_USERNAME}    ${PASSWORD}
    Verify Mia Orange In Exam Date Participants
    Close Browser

*** Keywords ***
Student Logs In
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}

Teacher Logs In
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}

Login
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    xpath=//*[@id="header.link.login"]    5s
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]

Student Registers For Exam Date
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]

Verify Success Alert On Other Exam Dates
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert    5s

Verify Exam Date Presence In My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Page Should Contain    xpath=//td[text()="Programming in Java"]

Verify Mia Orange In Exam Date Participants
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Page Should Contain    xpath=//td[text()="Mia Orange"]