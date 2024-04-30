*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${DELAY}          2s
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser And Maximize
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form

Go To My Subjects
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}

Unenroll Subject
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    ${DELAY}

Login As Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form

Go To My Subjects Page
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    ${DELAY}

Go To My Exam Dates Page
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}

Go To Set Evaluation Page
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}

Select Subject And Go To Evaluation Table
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Sleep    ${DELAY}
    Select From List By Index    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    1
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    ${DELAY}
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    2
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}

*** Test Cases ***
Student Unenrolls From Subject
    Open Browser And Maximize
    Login As Student
    Go To My Subjects
    Unenroll Subject
    [Teardown]    Close Browser

Teacher Checks Student Count
    Open Browser And Maximize
    Login As Teacher
    Go To My Subjects Page
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Go To My Exam Dates Page
    Element Should Contain    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Go To Set Evaluation Page
    Select Subject And Go To Evaluation Table
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Page Should Contain Element    xpath://td[text()="No students on this exam date"]
    [Teardown]    Close Browser