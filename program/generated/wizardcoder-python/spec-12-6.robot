*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Accept Alert
    Wait Until Page Contains Element    //*[@id="tea.myExamDates.successAlert"]
    Sleep   1s
    Accept Alert
    Sleep   1s


*** Test Cases ***
Test Teacher Scenario
    Open Browser    http://localhost:4680    chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Accept Alert
    Sleep   1s
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Page Should Contain Element    xpath://*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    -1
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep   1s
    Page Should Contain Element    xpath://*[@id="tea.evalTable.filter.noRecords"]
    [Teardown]    Close Browser



Test Student Scenario
    [Teardown]    Close Browser
    Open Browser    http://localhost:4680    chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Not Contain Element    xpath://*[@id="tea.menu.myExamDates"]