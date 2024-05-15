*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Button    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Confirm Action
    Page Should Contain    My Exam Dates
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Select From List By Value    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    1202    
    Click Button    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.5  
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures
    Close Browser