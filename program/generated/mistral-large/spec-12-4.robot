*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp
${USERNAME1}    scatterbrained
${PASSWORD1}    pass
${USERNAME2}    orange
${PASSWORD2}    pass

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Login As Teacher
    Teacher Actions
    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Login As Student
    Student Actions
    Close Browser

*** Keywords ***
Login As Teacher
    Input Text    //*[@id="loginPage.userNameInput"]    ${USERNAME1}
    Input Text    //*[@id="loginPage.passwordInput"]    ${PASSWORD1}
    Click Button    //*[@id="loginPage.loginFormSubmit"]

Login As Student
    Input Text    //*[@id="loginPage.userNameInput"]    ${USERNAME2}
    Input Text    //*[@id="loginPage.passwordInput"]    ${PASSWORD2}
    Click Button    //*[@id="loginPage.loginFormSubmit"]

Teacher Actions
    Click Element    xpath://[@id="tea.menu.myExamDates"]
    Click Element    xpath://[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Accept Alert
    ${page_title}    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    Page Should Contain Element    tea.myExamDates.successAlert
    Click Element    xpath://[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    tea.setEvaluation.form.noRecords
    Click Element    xpath://[@id="tea.menu.evaluationTable"]
    Click Element    xpath://[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Button    xpath://[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject

Student Actions
    Click Element    xpath://[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures