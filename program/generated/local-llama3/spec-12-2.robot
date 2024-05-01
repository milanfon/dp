*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Spec 12 Teacher
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Handle Alert    action=ACCEPT
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Element Should Contain    xpath://*[@id="tea.evalTable.filter.resultTable"]    No exam dates for this subject

Spec 12 Student
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Element Should Not Contain    xpath://*[@id="stu.myExamDates.table"]    Computation Structures
    Sleep    2s