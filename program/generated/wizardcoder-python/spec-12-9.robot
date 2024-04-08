*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}    http://localhost:4680
${DELAY}    ${5}

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Login As Teacher
    Teacher Scenario Steps
    Close Browser

Teacher Scenario Steps
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]    # Accept alert
    Wait Until Element Is Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Wait Until Element Is Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    -1
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Wait Until Element Is Not Visible    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Element Should Not Contain    xpath://*[@id="tea.evalTable.filter.submitButton"]    No exam dates for this subject
    Click Element    xpath://*[@id="tea.menu.myExamDates"]

Login As Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Login As Student
    Student Scenario Steps
    Close Browser

Student Scenario Steps
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Element Should Not Contain    xpath://*[@id="stu.myExamDates.table.myExamDates"]    Computation Structures

Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]