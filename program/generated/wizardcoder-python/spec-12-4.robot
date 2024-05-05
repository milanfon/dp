*** Settings ***
Documentation    This is a suite to test the University Information System
Library    SeleniumLibrary


*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${BROWSER}    Chrome
${DELAY}    0.5s
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER_WIDTH}    1501
${BROWSER_HEIGHT}    104


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Window Size    ${BROWSER_WIDTH}    ${BROWSER_HEIGHT}


*** Test Cases ***
Scenario Teacher
    Open Browser To Login Page
    Input Text    id:loginPage.userNameInput    scatterbrained
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.cancelButton-0-0
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Click Element    id:tea.evalTable.filter.submitButton
    Element Should Not Be Visible    id:tea.myExamDates.successAlert
    Page Should Contain Element    id:tea.evalTable.form.noRecords

    Click Element    id:tea.menu.myExamDates
    Page Should Contain Element    id:tea.myExamDates.successAlert
    Close Browser

    Open Browser To Login Page
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.myExamDates
    Page Should Not Contain    Computation Structures
    Close Browser

*** Keywords ***
Sleep
    [Arguments]    ${delay}
    Sleep    ${delay}

*** Keywords ***
Sleep
    [Arguments]    ${delay}
    Sleep    ${delay}