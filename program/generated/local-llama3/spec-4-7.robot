*** Settings ***
Library     SeleniumLibrary
Library     SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    Chrome
${DELAY}    1

*** Test Cases ***
Student Login
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    gray
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginButton"]
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Contain    xpath=//td    Database Systems
    Close Browser

Teacher Login
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Maximize Browser Window
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginButton"]
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0) 
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10) 
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Click Element    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Click Element    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Element Should Contain    xpath=//td    No students on this exam date
    Close Browser