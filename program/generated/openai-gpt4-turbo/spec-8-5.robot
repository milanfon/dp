*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${STUDENT_URL}     http://localhost:4680/tbuis/
${TEACHER_URL}     http://localhost:4680/tbuis/index.jsp
${BROWSER}         Chrome

*** Test Cases ***
Student Workflow Validation
    [Setup]    Open Browser    ${STUDENT_URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    green
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.otherExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.otherExamDates.table.registerButton-2-0"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.otherExamDates.successAlert"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Contain    Programming in Java
    [Teardown]    Close Browser

Teacher Workflow Validation
    [Setup]    Open Browser    ${TEACHER_URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    1s
    Page Should Contain    Mia Orange
    [Teardown]    Close Browser