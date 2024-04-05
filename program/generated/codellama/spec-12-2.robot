*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/
${BROWSER}        Chrome

*** Test Cases ***
Teacher Test
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]   1202
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    # Check if we are still on the "My Exam Dates" page and if element with id "tea.myExamDates.successAlert" is visible
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    # On page "Set Evaluation" check if element with id "tea.setEvaluation.form.noRecords" is visible
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    [Teardown]    Close Browser

Student Test
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    # Check if text "Computation Structures" is not present
    Page Should Not Contain    Computation Structures
    [Teardown]    Close Browser