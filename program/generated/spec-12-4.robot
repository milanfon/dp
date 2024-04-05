*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome

*** Test Cases ***
Teacher scenario
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Handle Alert    ACCEPT
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Page Should Not Contain    Computation Structures
    [Teardown]    Close Browser

Student scenario
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    [Teardown]    Close Browser