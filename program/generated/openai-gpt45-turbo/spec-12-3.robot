*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${LOGIN_URL}    http://localhost:4680/tbuis/login
${HOME_URL}    http://localhost:4680/tbuis/index.jsp
${TEACHER_OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${MY_EXAM_DATES_URL}    http://localhost:4680/tbuis/teacher-view/myExamDates
${SET_EVALUATION_URL}    http://localhost:4680/tbuis/teacher-view/setEvaluation
${EVALUATION_TABLE_URL}    http://localhost:4680/tbuis/teacher-view/evaluationTable
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview

*** Test Cases ***
Open University Information System As Teacher And Perform Actions
    Open Browser    ${HOME_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    1s
    Alert Should Be Present
    Accept Alert
    Location Should Be    ${MY_EXAM_DATES_URL}
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.successAlert"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    0
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject
    Close Browser

Open University Information System As Student And Verify Text Not Present
    Open Browser    ${HOME_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Not Contain    Computation Structures
    Close Browser