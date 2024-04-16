*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Handle Alert    ACCEPT
    Page Should Contain    My Exam Dates
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    Computation Structures
    Close Browser
