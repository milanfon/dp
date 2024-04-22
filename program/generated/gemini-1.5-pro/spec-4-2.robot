*** Settings ***
Library           SeleniumLibrary
Documentation     This is student test suite
Suite Setup       Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown    Close Browser
Test Teardown    Sleep    2s

*** Variables ***
${LOGIN URL}    http://localhost:4680/tbuis/login

*** Test Cases ***
Login Student and Unenroll Subject
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Location Is    ${LOGIN URL}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Submit Form
    Wait Until Location Contains    student-view/overview
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Wait Until Location Contains    student-view/mySubjects
    Sleep    2s
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Wait Until Location Contains    student-view/mySubjects
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath://td[text()="Database Systems"]

Login Teacher and Check Data
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Location Is    ${LOGIN URL}
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Submit Form
    Wait Until Location Contains    teacher-view/overview
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Location Contains    teacher-view/mySubjects
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0) 
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Wait Until Location Contains    teacher-view/myExamDates
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10) 
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Wait Until Location Contains    teacher-view/setEvaluation
    Sleep    2s
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Wait Until Location Contains    teacher-view/evaluationTable
    Sleep    2s
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
    Sleep    2s
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Wait Until Location Contains    teacher-view/evaluationTable?filterSubjectId=
    Sleep    2s
    Element Should Be Visible    xpath://td[text()="No students on this exam date"]
