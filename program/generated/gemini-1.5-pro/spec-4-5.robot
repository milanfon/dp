*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome
${DELAY}          2s

*** Test Cases ***
Spec 4 student
    Open Browser    ${INDEX URL}    ${BROWSER}
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Sleep    ${DELAY}
    Press Keys    xpath://*[@id="loginPage.userNameInput"]    TAB
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Press Keys    xpath://*[@id="loginPage.passwordInput"]    ENTER
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Sleep    ${DELAY}
    Element Should Not Be Visible    //td[text() = 'Database Systems']
    Sleep    ${DELAY}
    Close Browser
Spec 4 teacher
    Open Browser    ${INDEX URL}    ${BROWSER}
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Press Keys    xpath://*[@id="loginPage.userNameInput"]    TAB
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Press Keys    xpath://*[@id="loginPage.passwordInput"]    ENTER
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0) 
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10) 
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    Element Should Be Visible    //td[text() = 'No students on this exam date']
    Sleep    ${DELAY}
    Close Browser
