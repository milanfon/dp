*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}        Chrome
${DELAY}          0

*** Test Cases ***
Scenario: spec 4 student
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    [Teardown]    Close Browser
    Input Text    id=loginPage.userNameInput    gray
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.passwordInput
    Click Element    id=stu.menu.mySubjects
    Click Element    id=stu.mySubjects.enrolledTable.unenrollSubjectButton-1
    Click Element    id=stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton
    Element Should Be Visible    id=stu.mySubjects.successAlert
    Element Should Be Visible    id=stu.mySubjects.enrolledTable.Title
    Element Should Not Be Visible    xpath=//td[text()='Database Systems']

Scenario: spec 4 teacher
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    [Teardown]    Close Browser
    Input Text    id=loginPage.userNameInput    pedant
    Input Text    id=loginPage.passwordInput    pass
    Click Element    id=loginPage.passwordInput
    Click Element    id=tea.menu.mySubjects
    Click Element    id=tea.menu.myExamDates
    Click Element    id=tea.menu.setEvaluation
    Click Element    id=tea.setEvaluation.form.examTermDateSelect
    Click Element    id=tea.setEvaluation.form.examTermDateSelect
    Click Element    id=tea.menu.evaluationTable
    Click Element    id=tea.evalTable.filter.subjectSelect
    Click Element    id=tea.evalTable.filter.subjectSelect
    Click Element    id=tea.evalTable.filter.submitButton
    Element Should Be Visible    id=tea.mySubjects.table.listOfStudentsButton-1
    Element Should Be Visible    id=tea.myExamDates.table.participantsButton-1-0
    Element Should Be Visible    id=tea.setEvaluation.form.noOneStudent
    Element Should Be Visible    xpath=//td[text()='No students on this exam date']