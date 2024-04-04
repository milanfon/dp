*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 4 Student
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Sleep    1s
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    1s
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    1s
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath://td[contains(text(), 'Database Systems')]
    Close Browser

Spec 4 Teacher
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1s
    Element Should Be Visible    xpath://*[@id="tea.evalTable.table.noStudents"]
    Close Browser