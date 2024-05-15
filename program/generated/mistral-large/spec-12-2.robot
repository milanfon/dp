*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    2s

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Teacher
    Teacher Actions
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Student
    Student Actions
    Check Computation Structures Text Not Present
    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    xpath://[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Teacher Actions
    Click Element    xpath://[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath://[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    ${DELAY}
    Accept Alert
    Page Should Contain Element    xpath://[@id="tea.myExamDates.successAlert"]
    Element Should Be Visible    xpath://[@id="tea.myExamDates.successAlert"]
    Sleep    ${DELAY}
    Click Element    xpath://[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://[@id="tea.setEvaluation.form.noRecords"]
    Sleep    ${DELAY}
    Click Element    xpath://[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Select From List By Index    xpath://[@id="tea.evalTable.filter.subjectSelect"]    0
    Sleep    ${DELAY}
    Click Button    xpath://[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    Page Should Contain    No exam dates for this subject

Login As Student
    Input Text    xpath://[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Student Actions
    Click Element    xpath://[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}

Check Computation Structures Text Not Present
    Page Should Not Contain    Computation Structures