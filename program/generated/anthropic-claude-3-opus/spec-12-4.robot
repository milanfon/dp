*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    1s
    Handle Alert    ACCEPT
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/myExamDates
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Wait Until Page Contains Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Wait Until Page Contains Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Wait Until Page Contains    No exam dates for this subject
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://*[@id="stu.menu.myExamDates"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures
    Close Browser