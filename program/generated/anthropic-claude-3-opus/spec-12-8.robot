*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${BASE_URL}    http://localhost:4680/tbuis/

*** Test Cases ***
Teacher Scenario
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Handle Alert    ACCEPT
    Page Should Contain    My Exam Dates
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    1s
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    1s
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    1s
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Scenario
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    1s
    Page Should Not Contain    Computation Structures
    Close Browser