*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${DELAY}    1s
${URL}      http://localhost:4680
${BROWSER}    Chrome
${USER}    scatterbrained
${PASS}    pass

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1501    104
    Input Text    id:loginPage.userNameInput    ${USER}
    Input Text    id:loginPage.passwordInput    ${PASS}
    Click Element    id:loginPage.loginFormSubmit
    Click Element    id:tea.menu.myExamDates
    Click Element    id:tea.myExamDates.table.cancelButton-0-0
    Click Element    id:tea.menu.setEvaluation
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Click Element    id:tea.evalTable.filter.subjectSelect > option:nth-of-type(2)
    Click Element    id:tea.evalTable.filter.submitButton
    Sleep    ${DELAY}
    ${current_page}=    Get Location
    ${current_page_url}=    Get Location
    ${current_page_title}=    Get Title
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    id:tea.myExamDates.successAlert
    Should Be True    ${exists}
    Should Be Equal    ${current_page}    ${URL}teacher-view/myExamDates
    Should Be Equal    ${current_page_title}    Teacher's View
    Click Element    id:tea.menu.setEvaluation
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    id:tea.setEvaluation.form.noRecords
    Should Be True    ${exists}
    Click Element    id:tea.menu.evaluationTable
    Click Element    id:tea.evalTable.filter.subjectSelect
    Click Element    id:tea.evalTable.filter.subjectSelect > option:nth-of-type(2)
    Click Element    id:tea.evalTable.filter.submitButton
    Sleep    ${DELAY}
    ${exists}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//*[contains(text(), 'No exam dates for this subject')]
    Should Be True    ${exists}
    Close Browser