*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    2s

*** Test Cases ***
Teacher Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    ${DELAY}
    Confirm Action
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Not Contain    Computation Structures
    Close Browser
