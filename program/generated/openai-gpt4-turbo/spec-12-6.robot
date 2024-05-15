*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TEACHER_LOGIN_URL}    http://localhost:4680/tbuis/login
${TEACHER_HOME_URL}    http://localhost:4680/tbuis/teacher-view/overview
${STUDENT_HOME_URL}    http://localhost:4680/tbuis/student-view/overview
${MY_EXAM_DATES_URL}    http://localhost:4680/tbuis/teacher-view/myExamDates
${SET_EVALUATION_URL}    http://localhost:4680/tbuis/teacher-view/setEvaluation
${EVALUATION_TABLE_URL}    http://localhost:4680/tbuis/teacher-view/evaluationTable?filterSubjectId=1202

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Login As Teacher
    Navigate To My Exam Dates
    Handle My Exam Dates Actions
    Navigate To Set Evaluation
    Check No Records On Set Evaluation
    Navigate To Evaluation Table
    Handle Evaluation Table Actions
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Login As Student
    Navigate To My Exam Dates As Student
    Verify Text Not Present    Computation Structures
    Close Browser

*** Keywords ***
Login As Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Location Should Be    ${TEACHER_HOME_URL}

Navigate To My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Location Should Be    ${MY_EXAM_DATES_URL}

Handle My Exam Dates Actions
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Alert Should Be Present
    Accept Alert
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.successAlert"]

Navigate To Set Evaluation
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Location Should Be    ${SET_EVALUATION_URL}

Check No Records On Set Evaluation
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noRecords"]

Navigate To Evaluation Table
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Location Should Be    ${EVALUATION_TABLE_URL}

Handle Evaluation Table Actions
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    0
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject

Login As Student
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Location Should Be    ${STUDENT_HOME_URL}

Navigate To My Exam Dates As Student
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Location Should Be    http://localhost:4680/tbuis/student-view/myExamDates