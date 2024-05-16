*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${STUDENT_LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_USERNAME}     gray
${STUDENT_PASSWORD}     pass
${TEACHER_LOGIN_URL}    http://localhost:4680/tbuis/login
${TEACHER_USERNAME}     pedant
${TEACHER_PASSWORD}     pass

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${STUDENT_PASSWORD}
    Sleep    1s
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Sleep    3s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Page Should Contain Element    id=stu.mySubjects.successAlert
    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    Page Should Not Contain Element    xpath=//td[contains(text(),'Database Systems')]
    Close Browser

Teacher Scenario
    Open Browser    ${TEACHER_LOGIN_URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${TEACHER_PASSWORD}
    Sleep    1s
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Sleep    3s
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
    Close Browser