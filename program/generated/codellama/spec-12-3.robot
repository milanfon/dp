*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Test
    [Setup]    Open Browser    http://localhost:4680/tbuis/    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]   1202
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    [Teardown]    Close Browser

Student Test
    [Setup]    Open Browser    http://localhost:4680/tbuis/    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures
    [Teardown]    Close Browser