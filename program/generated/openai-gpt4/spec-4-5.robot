*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To LoginPage
Suite Teardown    Close Browser

*** Variables ***
${STUDENT_URL}    http://localhost:4680/tbuis/index.jsp
${TEACHER_URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_PAGE}     http://localhost:4680/tbuis/login
${STUDENT_USERNAME}    gray
${STUDENT_PASSWORD}    pass
${TEACHER_USERNAME}    pedant
${TEACHER_PASSWORD}    pass

*** Keywords ***
Open Browser To LoginPage
    [Arguments]    ${URL}
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104

Login As Student
    Go To    ${LOGIN_PAGE}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${STUDENT_PASSWORD}
    Press Keys    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s

Login As Teacher
    Go To    ${LOGIN_PAGE}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${TEACHER_PASSWORD}
    Press Keys    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s

*** Test Cases ***
Student Actions
    [Setup]    Open Browser To LoginPage    ${STUDENT_URL}
    Login As Student
    Wait Until Page Contains    Student's View
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    id=stu.mySubjects.successAlert
    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    Page Should Not Contain Element    xpath=//td[contains(text(), 'Database Systems')]

Teacher Actions
    [Setup]    Open Browser To LoginPage    ${TEACHER_URL}
    Login As Teacher
    Wait Until Page Contains    Teacher's View
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    id=tea.mySubjects.table.listOfStudentsButton-1    Students (0)
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Element Should Contain    id=tea.myExamDates.table.participantsButton-1-0    Participants (0/10)
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Sleep    1s
    Page Should Contain Element    id=tea.setEvaluation.form.noOneStudent
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    2
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Element Should Contain    xpath=//td    No students on this exam date