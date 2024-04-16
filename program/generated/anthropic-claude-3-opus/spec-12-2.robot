*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    1s
    Handle Alert    ACCEPT
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.successAlert"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Value    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    Computation Structures
    Close Browser