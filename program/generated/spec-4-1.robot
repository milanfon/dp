*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario: spec 4 student
    [Setup]    Open Browser    ${URL}    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath://td[contains(text(), "Database Systems")]
    Close Browser

Scenario: spec 4 teacher
    [Setup]    Open Browser    ${URL}    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Element Text Should Be    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Input Text    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    35
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Input Text    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    3
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Element Should Be Visible    xpath://td[contains(text(), "No students on this exam date")]
    Close Browser