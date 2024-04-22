*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Accept Alert
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Click Element    xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Handle Alert    ACCEPT
    Page Should Contain Element    xpath///*[@id="tea.myExamDates.successAlert"]
    Close Browser

Check No Records on Set Evaluation Page
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    xpath///*[@id="tea.setEvaluation.form.noRecords"]
    Close Browser

Filter Exam Dates on Evaluation Table
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath///*[@id="header.link.login"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath///*[@id="tea.menu.evaluationTable"]
    Select From List by Value    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Element    xpath///*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject
    Close Browser