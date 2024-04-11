*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_PAGE}    http://localhost:4680/tbuis/login
${TEACHER_VIEW}    http://localhost:4680/tbuis/teacher-view/overview
${MY_EXAM_DATES_PAGE}    http://localhost:4680/tbuis/teacher-view/myExamDates
${SET_EVALUATION_PAGE}    http://localhost:4680/tbuis/teacher-view/setEvaluation
${EVALUATION_TABLE_PAGE}    http://localhost:4680/tbuis/teacher-view/evaluationTable
${STUDENT_VIEW}    http://localhost:4680/tbuis/student-view/overview
${STUDENT_MY_EXAM_DATES}    http://localhost:4680/tbuis/student-view/myExamDates

*** Test Cases ***
Teacher Workflow
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Location Should Be    ${TEACHER_VIEW}
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Alert Should Be Present
    Accept Alert
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    0
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Workflow
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Location Should Be    ${STUDENT_VIEW}
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    Computation Structures
    Close Browser