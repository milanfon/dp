*** Settings ***
Library           SeleniumLibrary
Suite Setup      Open Browser    chrome
Suite Teardown    Close Browser

*** Variables ***
${URL}         http://localhost:4680/tbuis/index.jsp
${USERNAME}    gray
${PASSWORD}    pass
${USERNAME_TEACHER}    pedant
${PASSWORD_TEACHER}    pass

*** Test Cases ***
Student View
    Navigate to    ${URL}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Wait Until Element Is Present    xpath://*[@id="stu.mySubjects.successAlert"]
    Wait Until Element Is Present    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Present    xpath://td[text()='Database Systems']

Teacher View
    Close Browser
    Open Browser    chrome
    Navigate to    ${URL}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME_TEACHER}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD_TEACHER}
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Wait Until Element Is Present    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Wait Until Element Is Present    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
    Wait Until Element Is Present    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Wait Until Element Is Present    xpath://td[text()='No students on this exam date']
    Sleep    2 seconds