*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    0.5

*** Test Cases ***
Student Unenrolls From Subject
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Click Element    xpath://a[@id="header.link.login"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    gray
    Input Password    xpath://input[@id="loginPage.passwordInput"]    pass
    Submit Form
    Click Element    xpath://a[@id="stu.menu.mySubjects"]
    Click Element    xpath://button[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath://button[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Page Should Contain Element    xpath://div[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath://div[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath://td[text()="Database Systems"]
    Close Browser

Teacher Checks For Unenrolled Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window 
    Set Selenium Speed    ${DELAY}
    Click Element    xpath://a[@id="header.link.login"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    pedant
    Input Password    xpath://input[@id="loginPage.passwordInput"]    pass
    Submit Form
    Click Element    xpath://a[@id="tea.menu.mySubjects"]
    Element Text Should Be    xpath://button[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath://a[@id="tea.menu.myExamDates"]
    Element Text Should Be    xpath://button[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath://a[@id="tea.menu.setEvaluation"]
    Select From List By Index    xpath://select[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Page Should Contain Element    xpath://div[@id="tea.setEvaluation.form.noOneStudent"]
    Click Element    xpath://a[@id="tea.menu.evaluationTable"]
    Select From List By Index    xpath://select[@id="tea.evalTable.filter.subjectSelect"]    2
    Click Element    xpath://button[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain Element    xpath://td[contains(text(),"No students on this exam date")]
    Close Browser