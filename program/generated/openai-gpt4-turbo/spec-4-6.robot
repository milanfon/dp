*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_VIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${TEACHER_VIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${MY_SUBJECTS_URL}    http://localhost:4680/tbuis/student-view/mySubjects
${TEACHER_MY_SUBJECTS_URL}    http://localhost:4680/tbuis/teacher-view/mySubjects
${MY_EXAM_DATES_URL}    http://localhost:4680/tbuis/teacher-view/myExamDates
${SET_EVALUATION_URL}    http://localhost:4680/tbuis/teacher-view/setEvaluation
${EVALUATION_TABLE_URL}    http://localhost:4680/tbuis/teacher-view/evaluationTable

*** Test Cases ***
Student Unenrollment Process
    Open Browser    ${URL}    Chrome
    [Teardown]    Close Browser
    Maximize Browser Window
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Wait Until Page Contains    Login Page
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    gray
    Press Keys    None    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    1s
    Wait Until Page Contains    Student's View
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    1s
    Wait Until Page Contains    My Subjects
    Click Element    xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
    Page Should Not Contain Element    xpath=//td[text()="Database Systems"]
    Sleep    1s

Teacher Verification for Unenrollment
    Open Browser    ${URL}    Chrome
    [Teardown]    Close Browser
    Maximize Browser Window
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Wait Until Page Contains    Login Page
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    pedant
    Press Keys    None    TAB
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Keys    None    ENTER
    Sleep    1s
    Wait Until Page Contains    Teacher's View
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    1s
    Wait Until Page Contains    My Subjects
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]    Students (0)
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Wait Until Page Contains    My Exam Dates
    Element Should Contain    xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]    Participants (0/10)
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Wait Until Page Contains    Set Evaluation
    Select From List By Index    xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]    2
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Wait Until Page Contains    Evaluation Table
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    3
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1s
    Wait Until Page Contains    No students on this exam date
    Page Should Contain Element    xpath=//td[text()="No students on this exam date"]