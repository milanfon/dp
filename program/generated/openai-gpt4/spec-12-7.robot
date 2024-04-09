*** Settings ***
Library           SeleniumLibrary
Suite Setup       Set Selenium Speed    2s
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Perform Actions As Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Handle Alert    accept
    Wait Until Element Is Visible    xpath=//*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Wait Until Element Is Visible    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    0
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject

Log In As Student And Check For Specific Text
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures