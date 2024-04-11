*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680/tbuis/index.jsp
${USERNAME_TEACHER}    scatterbrained
${PASSWORD}    pass
${USERNAME_STUDENT}    orange
${LOGIN_PAGE_TITLE}    Login Page
${TEACHER_VIEW_TITLE}    Teacher's View
${STUDENT_VIEW_TITLE}    Student View
${NO_RECORDS_TEXT}    No exam dates for this subject
${COMPUTATION_STRUCTURES_TEXT}    Computation Structures

*** Test Cases ***
Teacher's Workflow
    Open Browser    ${URL}    ${BROWSER}
    Login    ${USERNAME_TEACHER}    ${PASSWORD}
    Access My Exam Dates
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Accept Alert
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Access Set Evaluation
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Access Evaluation Table
    Select First Option From Subject Dropdown
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    ${NO_RECORDS_TEXT}
    Close Browser

Student's Workflow
    Open Browser    ${URL}    ${BROWSER}
    Login    ${USERNAME_STUDENT}    ${PASSWORD}
    Access My Exam Dates As Student
    Page Should Not Contain    ${COMPUTATION_STRUCTURES_TEXT}
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Access My Exam Dates
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s

Access Set Evaluation
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s

Access Evaluation Table
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s

Select First Option From Subject Dropdown
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1
    Sleep    2s

Access My Exam Dates As Student
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s