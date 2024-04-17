*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Teacher
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Accept Alert
    Location Should Be    ${URL}/teacher-view/myExamDates
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    0
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject
    Close Browser

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login As Student
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures
    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]