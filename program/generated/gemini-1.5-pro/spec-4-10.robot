*** Settings ***
Library           SeleniumLibrary
Documentation     Student unenrolls from subject and teacher checks if student is unenrolled.

*** Variables ***
${BROWSER}        chrome
${DELAY}          2s

*** Test Cases ***
Student unenrolls from subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form
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
    Element Should Not Be Visible    xpath://td[text()="Database Systems"]
    Sleep    ${DELAY}
    Close Browser

Teacher checks if student is unenrolled
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form
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
    Element Should Be Visible    xpath://td[text()="No students on this exam date"]
    Sleep    ${DELAY}
    Close Browser
