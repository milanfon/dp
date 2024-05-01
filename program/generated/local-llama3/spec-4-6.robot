*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    chrome
Suite Teardown    Close Browser

*** Variables ***
${DELAY}    1

*** Test Cases ***
Student View
    Open Page    http://localhost:4680/tbuis/index.jsp
    Click    xpath://*[@id="header.link.login"]
    Input    xpath://*[@id="loginPage.userNameInput"]    gray
    Input    xpath://*[@id="loginPage.passwordInput"]    pass
    Click    xpath://*[@id="loginPage.loginButton"]
    Click    xpath://*[@id="stu.menu.mySubjects"]
    Click    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath://td[text="Database Systems"]
    Sleep    ${DELAY}

Teacher View
    Open Page    http://localhost:4680/tbuis/index.jsp
    Click    xpath://*[@id="header.link.login"]
    Input    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input    xpath://*[@id="loginPage.passwordInput"]    pass
    Click    xpath://*[@id="loginPage.loginButton"]
    Click    xpath://*[@id="tea.menu.mySubjects"]
    Click    xpath://*[@id="tea.menu.myExamDates"]
    Click    xpath://*[@id="tea.menu.setEvaluation"]
    Click    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Select From List By Index    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    2
    Click    xpath://*[@id="tea.menu.evaluationTable"]
    Click    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    3
    Click    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"][text="Students (0) "]
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"][text="Participants (0/10) "]
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Page Should Contain Element    xpath://td[text="No students on this exam date"]
    Sleep    ${DELAY}