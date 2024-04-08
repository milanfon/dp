*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    chrome

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    scatterbrained
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.cancelButton-0-0
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Select From List    id:tea.evalTable.filter.subjectSelect    -1
    Click Element    id:tea.evalTable.filter.submitButton
    Close Browser

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    orange
    Input Text    id:loginPage.passwordInput    pass
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:stu.menu.myExamDates
    Close Browser

*** Keywords ***
Open Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}    options=add_argument("--headless")

Set Window Size
    [Arguments]    ${width}    ${height}
    ${browser}    Get Selenium Window Size
    ${width}    Evaluate    ${width} - ${browser['width']
    ${height}    Evaluate    ${height} - ${browser['height']
    Execute JavaScript    window.resizeBy(${width}, ${height})

Click Element
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}
    Click Element    ${selector}

Select From List
    [Arguments]    ${selector}    ${value}
    Wait Until Element Is Visible    ${selector}
    Select From List By Value    ${selector}    ${value}

Input Text
    [Arguments]    ${selector}    ${value}
    Wait Until Element Is Visible    ${selector}
    Input Text    ${selector}    ${value}