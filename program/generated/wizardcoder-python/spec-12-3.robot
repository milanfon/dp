*** Settings ***
Library    SeleniumLibrary    WITH NAME    Selenium


*** Test Cases ***
Scenario Teacher
    Open Browser    http://localhost:4680    Chrome
    Set Window Size    1000    100
    Input Text    id:loginPage.userNameInput    scatterbrained
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:tea.menu.myExamDates
    Click Button    id:tea.myExamDates.table.cancelButton-0-0
    ${alert}    Get Alert Message
    Accept Alert
    Page Should Contain Element    id:tea.myExamDates.successAlert
    Click Link    id:tea.menu.setEvaluation
    Page Should Contain Element    id:tea.setEvaluation.form.noRecords
    Click Link    id:tea.menu.evaluationTable
    Select From List By Value    id:tea.evalTable.filter.subjectSelect   1202
    Click Button    id:tea.evalTable.filter.submitButton
    Page Should Contain    No exam dates for this subject
    Close Browser

Scenario Student
    Open Browser    http://localhost:4680    Chrome
    Set Window Size    100    100
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    Click Link    id:stu.menu.myExamDates
    Page Should Not Contain    Computation Structures
    Close Browser