*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}    0.5s
${BROWSER_OPTIONS}    headless=False

*** Keywords ***
Accept Alert
    Execute Javascript    window.confirm = function() { return true; }

*** Test Cases ***
Teacher's Scenario
    Open Browser    ${URL}    ${BROWSER}    options=${BROWSER_OPTIONS}
    Set Window Size    ${1501}    ${104}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    ${DELAY}
    Accept Alert
    Sleep    ${DELAY}
    ${myExamDatesPage}    Get Title
    Should Be Equal    ${myExamDatesPage}    Teacher's View
    ${isVisible}    Get Element Attribute    xpath=//*[@id="tea.myExamDates.successAlert"]@hidden
    Should Be Equal    ${isVisible}    ${False}
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    ${setEvaluationPage}    Get Title
    Should Be Equal    ${setEvaluationPage}    Teacher's View
    ${isVisible}    Get Element Attribute    xpath=//*[@id="tea.setEvaluation.form.noRecords"]@hidden
    Should Be Equal    ${isVisible}    ${False}
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    -1
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    ${noRecords}    Get Element Text    xpath=//*[@id="tea.evalTable.noRecords"]
    Should Be Equal    ${noRecords}    No exam dates for this subject
    Close Browser

Student's Scenario
    Open Browser    ${URL}    ${BROWSER}    options=${BROWSER_OPTIONS}
    Set Window Size    ${1501}    ${104}
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    ${textNotPresent}    Run Keyword And Return Status    Element Should Not Contain    ${None}    Computation Structures
    Should Be True    ${textNotPresent}
    Close Browser