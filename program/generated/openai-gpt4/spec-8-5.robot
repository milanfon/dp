*** Settings ***
Documentation     This scenario covers the registration for an exam date by a student and subsequent verifications by both the student and a teacher.
Library           SeleniumLibrary

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_USER}    green
${TEACHER_USER}    strict
${PASSWORD}    pass

*** Test Cases ***
Student Registers For An Exam Date
    [Tags]    Student
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Login    ${STUDENT_USER}    ${PASSWORD}
    Go To Other Exam Dates
    Register For Exam Date
    Verify Success Alert
    Go To My Exam Dates
    Verify Exam Date "Programming in Java"
    Close Browser

Teacher Verifies Student Registration
    [Tags]    Teacher
    Open Browser    ${LOGIN_URL}    Chrome
    Maximize Browser Window
    Login    ${TEACHER_USER}    ${PASSWORD}
    Go To My Exam Dates
    Verify Student "Mia Orange"
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    xpath=//*[@id="header.link.login"]    timeout=10
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]

Go To Other Exam Dates
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]

Register For Exam Date
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]

Verify Success Alert
    Wait Until Element Is Visible    id=stu.otherExamDates.successAlert    timeout=10

Go To My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]

Verify Exam Date
    [Arguments]    ${examName}
    Page Should Contain    xpath=//td[text()="${examName}"]

Verify Student
    [Arguments]    ${studentName}
    Page Should Contain    xpath=//td[text()="${studentName}"]