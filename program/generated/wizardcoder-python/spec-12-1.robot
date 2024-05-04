Here's the Robot Framework scenario:


*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    http://localhost:4680/tbuis/login
${BROWSER}    Chrome

*** Test Cases ***
Teacher Spec 12
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    scatterbrained
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.cancelButton-0-0
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Select From List By Value    id:tea.evalTable.filter.subjectSelect    -1
    Click Element    id:tea.evalTable.filter.submitButton
    Click Element    id:tea.menu.myExamDates
    Page Should Contain Element    id:tea.myExamDates.successAlert
    Page Should Contain Element    id:tea.setEvaluation.form.noRecords
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Select From List By Value    id:tea.evalTable.filter.subjectSelect   1202
    Click Element    id:tea.evalTable.filter.submitButton
    Page Should Contain    No exam dates for this subject
    [Teardown]    Close Browser

Student Spec 12
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.myExamDates
    Page Should Not Contain    Computation Structures
    [Teardown]    Close Browser


*** Keywords ***
Accept Alert
    Wait Until Page Contains Element    id:tea.myExamDates.successAlert
    Click Element    id:tea.myExamDates.successAlert
    Wait Until Page Contains Element    id:tea.setEvaluation.form.noRecords

Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Set Window Size
    [Arguments]    ${width}    ${height}
    ${width}    ${height}    Evaluate    ${width}    ${height}
    Execute JavaScript    window.resizeTo(${width}, ${height})

Click Element
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}
    Click Element    ${selector}

Select From List By Value
    [Arguments]    ${selector}    ${value}
    Wait Until Element Is Visible    ${selector}
    Select From List By Value    ${selector}    ${value}

Page Should Contain Element
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}
    Page Should Contain Element    ${selector}

Page Should Contain
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}

Page Should Not Contain
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}    timeout=3
    Page Should Not Contain    ${text}

Page Should Contain Element
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}
    Page Should Contain Element    ${selector}

Page Should Not Contain Element
    [Arguments]    ${selector}
    Wait Until Element Is Not Visible    ${selector}    timeout=3
    Page Should Not Contain Element    ${selector}

Page Should Not Contain    ${text}
    Wait Until Page Contains    ${text}    timeout=3
    Page Should Not Contain    ${text}

Input Text
    [Arguments]    ${selector}    ${text}
    Wait Until Element Is Visible    ${selector}
    Input Text    ${selector}    ${text}

Wait Until Element Is Visible
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}    timeout=5

Wait Until Element Is Not Visible
    [Arguments]    ${selector}    ${timeout}=5
    Wait Until Element Is Not Visible    ${selector}    ${timeout}

Wait Until Page Contains
    [Arguments]    ${text}    ${timeout}=5
    Wait Until Page Contains    ${text}    ${timeout}

Wait Until Page Contains Element
    [Arguments]    ${selector}    ${timeout}=5
    Wait Until Page Contains Element    ${selector}    ${timeout}

Wait Until Element Is Enabled
    [Arguments]    ${selector}    ${timeout}=5
    Wait Until Element Is Enabled    ${selector}    ${timeout}

Wait Until Element Is Not Enabled
    [Arguments]    ${selector}    ${timeout}=5
    Wait Until Element Is Not Enabled    ${selector}    ${timeout}

Wait Until Element Is Not Visible
    [Arguments]    ${selector}    ${timeout}=5
    Wait Until Element Is Not Visible    ${selector}    ${timeout}

Wait Until Element Is Visible
    [Arguments]    ${selector}    ${timeout}=5
    Wait Until Element Is Visible    ${selector}    ${timeout} 