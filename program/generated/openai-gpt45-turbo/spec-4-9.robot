*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${STUDENT_URL}    http://localhost:4680/tbuis/index.jsp
${TEACHER_URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Student Unenrollment Check
    Open Browser    ${STUDENT_URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    gray
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath=//td[text()="Database Systems"]
    Close Browser

Teacher Evaluation Check
    Open Browser    ${TEACHER_URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Press Key    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    2
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1s
    Element Should Be Visible    xpath=//td[text()="No students on this exam date"]
    Close Browser