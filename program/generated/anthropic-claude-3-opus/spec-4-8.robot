*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    1

*** Test Cases ***
Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Press Keys    xpath://*[@id="loginPage.passwordInput"]    RETURN
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath://td[contains(text(),'Database Systems')]
    Close Browser

Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window  
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}  
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Press Keys    xpath://*[@id="loginPage.passwordInput"]    RETURN
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Sleep    ${DELAY}  
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.setEvaluation"] 
    Sleep    ${DELAY}
    Select From List By Index    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Sleep    ${DELAY}  
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    2
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://td[contains(text(),'No students on this exam date')]
    Close Browser