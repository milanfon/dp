*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${TEACHER_URL}    http://localhost:4680/tbuis/index.jsp
${STUDENT_URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login

*** Test Cases ***
Teacher Scenario
    Open Browser    ${TEACHER_URL}    ${BROWSER}
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    1s
    Alert Should Be Present
    Accept Alert
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.successAlert"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    1s
    Select From List By Value    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1s
    Page Should Contain    No exam dates for this subject
    Sleep    1s
    Close Browser

Student Scenario
    Open Browser    ${STUDENT_URL}    ${BROWSER}
    Sleep    1s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Not Contain    Computation Structures
    Sleep    1s
    Close Browser