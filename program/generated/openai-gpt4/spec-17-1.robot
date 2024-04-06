*** Settings ***
Documentation     Validates functionality for a teacher and a student regarding subject participation and visibility.
Library           SeleniumLibrary

*** Variables ***
${TEACHER_LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_LOGIN_URL}    http://localhost:4680/tbuis/login
${USERNAME_TEACHER}     pedant
${PASSWORD}             pass
${USERNAME_STUDENT}     yellow

*** Test Cases ***
Teacher Participates In Others' Subject And Verifies
    Open Browser    ${TEACHER_LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Teacher Logs In And Participates
    Verify Participation Success On Others' Subjects Page
    Verify Linear Algebra Not Present In My Exam Dates
    Verify Linear Algebra Option In New Exam Dates
    Verify Linear Algebra Details In List Of All Teachers
    Close Browser

Student Verifies Linear Algebra and Alice Pedant
    Open Browser    ${STUDENT_LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Student Logs In And Verifies
    Close Browser

*** Keywords ***
Teacher Logs In And Participates
    Login    ${USERNAME_TEACHER}
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Click Element    xpath=//*[@id="tea.otherSubjects.table.participateButton-3"]

Verify Participation Success On Others' Subjects Page
    Wait Until Element Is Visible    id=tea.otherSubjects.successAlert    5s

Verify Linear Algebra Not Present In My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Page Should Contain Element    xpath=//th[text()="Linear Algebra"]

Verify Linear Algebra Option In New Exam Dates
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Page Should Contain Element    xpath=//option[text()="Linear Algebra"]

Verify Linear Algebra Details In List Of All Teachers
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Student Logs In And Verifies
    Login    ${USERNAME_STUDENT}
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), "Linear Algebra")]
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), "Alice Pedant")]

Login
    [Arguments]    ${username}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
