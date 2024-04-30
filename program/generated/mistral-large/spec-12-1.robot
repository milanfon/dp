*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${BROWSER}    Chrome
${DELAY}    2s

*** Test Cases ***
Teacher Scenario
    Open Browser To Teacher's View
    Login As Teacher
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Accept Alert
    Sleep    ${DELAY}
    Page Should Contain    My Exam Dates
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    0
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Scenario
    Open Browser To Student's View
    Login As Student
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures
    Close Browser

*** Keywords ***
Open Browser To Teacher's View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Open Browser To Student's View
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]