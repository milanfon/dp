*** Settings ***
Documentation     Scenario for both student and teacher actions based on provided JSON recordings.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${STUDENT_URL}    http://localhost:4680/tbuis/index.jsp
${TEACHER_URL}    http://localhost:4680/tbuis/index.jsp
${STUDENT_USERNAME}  gray
${STUDENT_PASSWORD}  pass
${TEACHER_USERNAME}  pedant
${TEACHER_PASSWORD}  pass

*** Test Cases ***
Student Actions
    Open Browser    ${STUDENT_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${STUDENT_USERNAME}
    Sleep    2s
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${STUDENT_PASSWORD}
    Sleep    2s
    Press Keys    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    2s
    Page Should Contain Element    id=stu.mySubjects.successAlert
    Page Should Contain Element    id=stu.mySubjects.enrolledTable.Title
    Element Should Not Contain    tag=td    Database Systems
    Close Browser

Teacher Actions
    Open Browser    ${TEACHER_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${TEACHER_USERNAME}
    Sleep    2s
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${TEACHER_PASSWORD}
    Sleep    2s
    Press Keys    xpath=//*[@id="loginPage.passwordInput"]    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    id=tea.mySubjects.table.listOfStudentsButton-1    Students (0)
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Element Should Contain    id=tea.myExamDates.table.participantsButton-1-0    Participants (0/10)
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    2
    Sleep    2s
    Page Should Contain Element    id=tea.setEvaluation.form.noOneStudent
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    3
    Sleep    2s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Element Should Contain    tag=td    No students on this exam date
    Close Browser