*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680
${BROWSER}    Chrome
${DELAY}   0
${LOGIN}    admin
${PASS}    pass
${LOGIN_URL}    ${URL}/login
${LOGOUT_URL}    ${URL}/logout
${BROWSER_IMPLICIT_WAIT_TIMEOUT}   10
${BROWSER_TIMEOUT}   10
${BROWSER_EXECUTION_DELAY}   0


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${BROWSER_EXECUTION_DELAY}
    Set Selenium Implicit Wait    ${BROWSER_IMPLICIT_WAIT_TIMEOUT}
    Set Selenium Timeout    ${BROWSER_TIMEOUT}


Logout
    Go To    ${LOGOUT_URL}
    Close Browser

Login
    Open Browser To Login Page
    Input Text    id:loginPage.userNameInput    ${LOGIN}
    Input Text    id:loginPage.passwordInput    ${PASS}
    Click Button    id:loginPage.loginFormSubmit


Open Teacher's Exam Dates Page
    Click Link    xpath://*[@id="tea.menu.myExamDates"]


Open Set Evaluation Page
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]


Open Evaluation Table Page
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]


Click Cancel Button
    Click Button    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]


Click Filter Button
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]


Select Subject
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1


Check Element
    [Arguments]    ${locator}
    ${status}    Run Keyword And Return Status    Element Should Be Visible    ${locator}
    [Return]    ${status}


Check Element Not Visible
    [Arguments]    ${locator}
    ${status}    Run Keyword And Return Status    Element Should Not Be Visible    ${locator}
    [Return]    ${status}

Check Alert
    Alert Should Be Present
    Accept Alert

*** Test Cases ***
Scenario 1
    [Tags]    teacher
    [Setup]    Login
    Open Teacher's Exam Dates Page
    Click Cancel Button
    ${status}    Check Alert
    ${status}    Check Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Should Be True    ${status}    Element with id "tea.myExamDates.successAlert" is not visible
    Check Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Open Set Evaluation Page
    Check Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Open Evaluation Table Page
    Select Subject
    Click Filter Button
    Check Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Check Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    [Teardown]    Logout


Scenario 2
    [Tags]    student
    [Setup]    Login
    Check Element Not Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    [Teardown]    Logout