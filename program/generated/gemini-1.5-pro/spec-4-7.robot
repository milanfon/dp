*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${BROWSER}    chrome
${DELAY}    2s

*** Keywords ***
Open Login Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]

Login As Student
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form

Open My Subjects Page
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.mySubjects"]

Unenroll Subject
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]

Login As Teacher
    Sleep    ${DELAY}
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form

Open My Subjects Page As Teacher
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.mySubjects"]

Open My Exam Dates Page As Teacher
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]

Open Set Evaluation Page As Teacher
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]

Open Evaluation Table Page As Teacher
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]

*** Test Cases ***
Student Unenrolls From Subject
    Open Login Page
    Login As Student
    Open My Subjects Page
    Unenroll Subject
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath://td[text()="Database Systems"]

Teacher Checks For Unenrollment
    Login As Teacher
    Open My Subjects Page As Teacher
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1" and text()="Students (0) "]
    Open My Exam Dates Page As Teacher
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0" and text()="Participants (0/10) "]
    Open Set Evaluation Page As Teacher
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Open Evaluation Table Page As Teacher
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain Element    xpath://td[text()="No students on this exam date"]
