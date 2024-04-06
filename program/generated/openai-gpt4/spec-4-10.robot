*** Settings ***
Documentation     This test suite validates student and teacher actions on a university information system.
Library           SeleniumLibrary

*** Variables ***
${STUDENT_LOGIN_URL}    http://localhost:4680/tbuis/login
${TEACHER_LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_USERNAME}     gray
${STUDENT_PASSWORD}     pass
${TEACHER_USERNAME}     pedant
${TEACHER_PASSWORD}     pass

*** Test Cases ***
Student Scenario
    Open Browser    ${STUDENT_LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${STUDENT_PASSWORD}
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Wait Until Element Is Visible    id=stu.mySubjects.successAlert    5
    Wait Until Element Is Visible    id=stu.mySubjects.enrolledTable.Title    5
    Element Should Not Be Visible    xpath=//td[contains(text(), "Database Systems")]
    Close Browser

Teacher Scenario
    Open Browser    ${TEACHER_LOGIN_URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    1 seconds
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${TEACHER_PASSWORD}
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Element Should Contain    id=tea.mySubjects.table.listOfStudentsButton-1    Students (0)
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Element Should Contain    id=tea.myExamDates.table.participantsButton-1-0    Participants (0/10)
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    2
    Element Should Be Visible    id=tea.setEvaluation.form.noOneStudent
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    3
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Element Should Contain    xpath=//td    No students on this exam date
    Close Browser