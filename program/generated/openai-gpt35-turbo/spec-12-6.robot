*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Accept Alert
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Click Element    xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Handle Alert    accept
    Page Should Contain Element    xpath///*[@id="tea.myExamDates.successAlert"]
    Close Browser

Set Evaluation Page Check
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    xpath///*[@id="tea.setEvaluation.form.noRecords"]
    Close Browser

Evaluation Table Page Check
    Open Browser    ${url}    chrome
    Maximize Browser Window
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.evaluationTable"]
    Select From List by Index    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    0
    Click Element    xpath///*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject
    Close Browser