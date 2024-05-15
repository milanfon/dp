*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${MAIN_URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${TEACHER_VIEW_OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${MY_EXAM_DATES_URL}    http://localhost:4680/tbuis/teacher-view/myExamDates
${SET_EVALUATION_URL}    http://localhost:4680/tbuis/teacher-view/setEvaluation
${EVALUATION_TABLE_URL}    http://localhost:4680/tbuis/teacher-view/evaluationTable
${STUDENT_VIEW_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview

*** Test Cases ***
Teacher Workflow Execution
    Open Browser    ${MAIN_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Handle Alert    accept
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.successAlert"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    0
    Sleep    2s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Workflow Execution
    Open Browser    ${MAIN_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    Computation Structures
    Close Browser