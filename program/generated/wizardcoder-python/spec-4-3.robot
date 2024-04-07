*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    0.5s

*** Test Cases ***
Student Test
    Open browser    ${URL}    browser=${BROWSER}
    Input text    id:loginPage.userNameInput    gray
    Input text    id:loginPage.passwordInput    pass
    Click button    xpath://*[@id="loginPage.loginButton"]
    Wait until element is visible    xpath://*[@id="stu.menu.mySubjects"]
    Click element    xpath://*[@id="stu.menu.mySubjects"]
    Wait until element is visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Page should contain element    xpath://*[@id="stu.mySubjects.successAlert"]
    Page should contain element    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Page should not contain element    xpath://td[contains(text(), "Database Systems")]
    Close Browser

Teacher Test
    Open browser    ${URL}    browser=${BROWSER}
    Input text    id:loginPage.userNameInput    pedant
    Input text    id:loginPage.passwordInput    pass
    Click button    xpath://*[@id="loginPage.loginButton"]
    Click element    xpath://*[@id="tea.menu.mySubjects"]
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Wait until element is visible    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Element should contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click element    xpath://*[@id="tea.menu.myExamDates"]
    Wait until element is visible    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Element should contain    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click element    xpath://*[@id="tea.menu.setEvaluation"]
    Click element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Click element    xpath://*[@id="tea.menu.evaluationTable"]
    Click element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select from list by value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]   3
    Click element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Wait until element is visible    xpath://*[@id="tea.evalTable.noStudents"]
    Page should contain element    xpath://*[@id="tea.evalTable.noStudents"]
    Close Browser