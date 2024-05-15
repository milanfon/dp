*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close All Browsers
Library    Dialogs

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    0.5s

*** Test Cases ***
Teacher spec
    [Setup]    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]//option[@value="1202"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    ${alert_exists}    Get Alert Message
    Run Keyword If    '${alert_exists}' == 'Are you sure you want to cancel the exam?'    Accept Alert
    Sleep    ${DELAY}
    ${exists}    Get WebElement    xpath=//*[@id="tea.myExamDates.successAlert"]
    Run Keyword If    '${exists}' == 'None'    Fail    Alert not accepted
    Page Should Contain    No exam dates for this subject
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]//option[@value="-1"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    ${exists}    Get WebElement    xpath=//*[@id="tea.evalTable.noExamDates"]
    Run Keyword If    '${exists}' == 'None'    Fail    No exam dates for this subject not visible
    [Teardown]    Close Browser

Student spec
    [Setup]    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures
    [Teardown]    Close Browser