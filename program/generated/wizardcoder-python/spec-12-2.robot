*** Settings ***
Library    SeleniumLibrary    run_on_failure=Close All Browsers

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    ${URL}    ${BROWSER}    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    scatterbrained
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.cancelButton-0-0
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Select From List    id:tea.evalTable.filter.subjectSelect    option=1202
    Click Element    id:tea.evalTable.filter.submitButton
    Click Element    id:tea.myExamDates.table.cancelButton-0-0
    Element Should Be Visible    id:tea.myExamDates.successAlert
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Select From List    id:tea.evalTable.filter.subjectSelect    option=1
    Click Element    id:tea.evalTable.filter.submitButton
    Element Should Not Contain    id:tea.evalTable.table    Computation Structures
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.cancelButton-0-0
    Element Should Be Visible    id:tea.myExamDates.table.cancelButton-0-0

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    ${URL}    ${BROWSER}    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.myExamDates
    Element Should Not Contain    id:stu.myExamDates.table    No exam dates for this subject