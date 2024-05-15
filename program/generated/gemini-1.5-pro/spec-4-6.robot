*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${DELAY}          2s

*** Keywords ***
Open Browser To Page
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}

Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    gray
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Submit Form

Go To My Subjects Page
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    ${DELAY}

Unenroll From Subject
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

Select Subject
    Click Element    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Sleep    ${DELAY}
    Select From List By Index    xpath://*[@id="tea.setEvaluation.form.examTermDateSelect"]    2
    Sleep    ${DELAY}

Go To Evaluation Table Page
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}

Select Subject And Filter
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    ${DELAY}
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    3
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}

*** Test Cases ***
Check Student Unenrollment
    Open Browser To Page    http://localhost:4680/tbuis/index.jsp
    Login As Student
    Go To My Subjects Page
    Unenroll From Subject
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.successAlert"]
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath://td[text()="Database Systems"]
    Close Browser

Check Teacher Views
    Open Browser To Page    http://localhost:4680/tbuis/index.jsp
    Login As Teacher
    Go To My Subjects Page
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-1" and text()="Students (0) "]
    Go To My Exam Dates Page
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.participantsButton-1-0" and text()="Participants (0/10) "]
    Go To Set Evaluation Page
    Select Subject
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noOneStudent"]
    Go To Evaluation Table Page
    Select Subject And Filter
    Page Should Contain Element    xpath://td[text()="No students on this exam date"]
    Close Browser
