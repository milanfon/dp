*** Settings ***
Documentation     A test suite for University Information System with teacher and student scenarios
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${DELAY}          2s

*** Test Cases ***
Teacher Scenario With My Exam Dates And Set Evaluation Checks
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    # Login as teacher
    Login    scatterbrained    pass
    # Teacher My Exam Dates
    Teacher My Exam Dates Actions
    # Teacher Set Evaluation
    Teacher Set Evaluation Actions
    # Teacher Evaluation Table
    Teacher Evaluation Table Actions
    Close Browser

Student Scenario With My Exam Dates Check
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}
    # Login as student
    Login    orange    pass
    # Student My Exam Dates
    Student My Exam Dates Check
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Teacher My Exam Dates Actions
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    ${DELAY}
    Handle Alert    Accept
    Sleep    ${DELAY}
    Page Should Contain Element    id=tea.myExamDates.successAlert

Teacher Set Evaluation Actions
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Page Should Contain Element    id=tea.setEvaluation.form.noRecords

Teacher Evaluation Table Actions
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    ${DELAY}
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    1
    Sleep    ${DELAY}
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    Page Should Contain    No exam dates for this subject

Student My Exam Dates Check
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain    Computation Structures
