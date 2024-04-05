*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    5s

*** Test Cases ***
Teacher Test
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    [Teardown]    Close Browser
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Accept Alert
    Wait Until Element Is Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Wait Until Element Is Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]   1202
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Wait Until Element Is Visible    xpath://*[@id="tea.evalTable.filter.noRecords"]

Student Test
    [Setup]    Open Browser    ${URL}    ${BROWSER}
    [Teardown]    Close Browser
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Wait Until Element Is Not Visible    xpath://*[@id="stu.menu.myExamDates"]    Computation Structures

*** Keywords ***
Wait Until Element Is Not Visible
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds    ${DELAY}    ${DELAY}    Element Should Not Be Visible    ${locator}    ${text}

Wait Until Element Is Visible
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    ${DELAY}    ${DELAY}    Element Should Be Visible    ${locator}

Select From List By Value
    [Arguments]    ${locator}    ${value}
    Wait Until Keyword Succeeds    ${DELAY}    ${DELAY}    Select From List By Value    ${locator}    ${value}