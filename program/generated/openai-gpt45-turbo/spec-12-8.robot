*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Workflow Verification
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    0.5s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    0.5s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    0.5s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    0.5s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    1s
    Alert Should Be Present
    Accept Alert
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    0
    Sleep    0.5s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Workflow Verification
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    0.5s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    0.5s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Sleep    0.5s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    0.5s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    Computation Structures
    Close Browser