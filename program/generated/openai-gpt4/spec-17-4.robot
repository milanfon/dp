*** Settings ***
Documentation     A scenario to validate elements on teacher and student views.
Library           SeleniumLibrary

Suite Setup       Open Browser And Setup
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}        Chrome
${BASE_URL}       http://localhost:4680/tbuis
${TEACHER_USERNAME}       pedant
${TEACHER_PASSWORD}       pass
${STUDENT_USERNAME}       yellow
${STUDENT_PASSWORD}       pass

*** Keywords ***
Open Browser And Setup
    Open Browser    ${BASE_URL}/index.jsp    ${BROWSER}
    Set Window Size    1501    1104

Login As Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${TEACHER_PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Login As Student
    Go To    ${BASE_URL}/login
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${STUDENT_PASSWORD}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Validate Teacher Elements
    Click Element    xpath=//*[@id="tea.menu.otherSubjects"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Page Should Contain    Linear Algebra
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.noRecords-2"]    No exam dates.
    Click Element    xpath=//*[@id="tea.menu.newExamDates"]
    Sleep    2s
    Page Should Contain Element    xpath=//option[text()="Linear Algebra"]
    Click Element    xpath=//*[@id="tea.menu.listOfAllTeachers"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant

Validate Student Elements
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant

*** Test Cases ***
Teacher View Validations
    [Setup]    Login As Teacher
    Validate Teacher Elements
    [Teardown]    Close Browser

Student View Validations
    [Setup]    Login As Student
    Validate Student Elements
    [Teardown]    Close Browser
