*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Spec 4 Student
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath://*[@id="loginPage.passwordInput"]    ENTER
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath://td[contains(text(), "Database Systems")]
    Close Browser

Spec 4 Teacher
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath://*[@id="loginPage.passwordInput"]    ENTER
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Element Text Should Be    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Press Keys    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    ARROW_DOWN
    Press Keys    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    ARROW_DOWN
    Press Keys    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    ARROW_DOWN
    Press Keys    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    ENTER
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Press Keys    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    ARROW_DOWN
    Press Keys    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    ARROW_DOWN
    Press Keys    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    ARROW_DOWN
    Press Keys    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    ENTER
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Element Should Be Visible    xpath://td[contains(text(), "No students on this exam date")]
    Close Browser