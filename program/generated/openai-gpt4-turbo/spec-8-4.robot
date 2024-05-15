*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${USERNAME_STUDENT}    green
${PASSWORD}    pass
${USERNAME_TEACHER}    strict

*** Test Cases ***
Student Workflow
    Open Browser    http://localhost:4680/tbuis/    Chrome
    Set Window Size    1501    1104
    Login As Student
    Navigate to Other Exam Dates
    Register for Exam
    Verify Success Alert on Other Exam Dates
    Navigate to My Exam Dates
    Verify Exam Present in My Exam Dates
    Close Browser

Teacher Workflow
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Login As Teacher
    Navigate to My Exam Dates as Teacher
    Verify Participant Name
    Close Browser

*** Keywords ***
Login As Student
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME_STUDENT}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

Login As Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${USERNAME_TEACHER}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

Navigate to Other Exam Dates
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    1s

Register for Exam
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s

Verify Success Alert on Other Exam Dates
    Page Should Contain Element    xpath=//*[@id="stu.otherExamDates.successAlert"]

Navigate to My Exam Dates
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s

Verify Exam Present in My Exam Dates
    Table Should Contain    xpath=//table    Programming in Java

Navigate to My Exam Dates as Teacher
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s

Verify Participant Name
    Table Should Contain    xpath=//table    Mia Orange