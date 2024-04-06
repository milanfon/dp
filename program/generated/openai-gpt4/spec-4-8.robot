*** Settings ***
Documentation     A test suite for student and teacher scenarios in the university information system.
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}       http://localhost:4680/tbuis
${STUDENT_USERNAME}  gray
${STUDENT_PASSWORD}  pass
${TEACHER_USERNAME}  pedant
${TEACHER_PASSWORD}  pass

*** Keywords ***
Open University System
    [Arguments]    ${url}
    Open Browser    ${url}    browser=Chrome
    Set Window Size    1501    1104

Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Press Keys    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    3s

Check Student Scenario Elements
    Page Should Contain Element    id=stu.mySubjects.successAlert
    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    Element Should Not Be Visible    xpath=//td[text()='Database Systems']

Check Teacher Scenario Elements
    Page Should Contain Element    id=tea.mySubjects.table.listOfStudentsButton-1
    Page Should Contain Text    id=tea.mySubjects.table.listOfStudentsButton-1    Students (0)
    Page Should Contain Element    id=tea.myExamDates.table.participantsButton-1-0
    Page Should Contain Text    id=tea.myExamDates.table.participantsButton-1-0    Participants (0/10)
    Page Should Contain Element    id=tea.setEvaluation.form.noOneStudent
    Element Should Contain    xpath=//td    No students on this exam date

*** Test Cases ***
Student Scenario
    Open University System    ${BASE_URL}/index.jsp
    Login    ${STUDENT_USERNAME}    ${STUDENT_PASSWORD}
    Check Student Scenario Elements
    Close Browser

Teacher Scenario
    Open University System    ${BASE_URL}/index.jsp
    Login    ${TEACHER_USERNAME}    ${TEACHER_PASSWORD}
    Check Teacher Scenario Elements
    Close Browser