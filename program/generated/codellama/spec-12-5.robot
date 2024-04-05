*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}    Chrome
${DELAY}    5s

*** Test Cases ***
Spec 12 Teacher
    [Setup]    Open Browser    about:blank    ${BROWSER}
    Teacher Test
    [Teardown]    Close Browser

Spec 12 Student
    [Setup]    Open Browser    about:blank    ${BROWSER}
    Student Test
    [Teardown]    Close Browser

*** Keywords ***
Teacher Test
    [Timeout]    1 minute
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    ${DELAY}
    Handle Alert    ACCEPT
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    Element Should Contain    xpath://*[@id="tea.evalTable.noRecords"]    No exam dates for this subject

Student Test
    [Timeout]    1 minute
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}
    Element Should Not Contain    xpath://*[@id="stu.menu.myExamDates"]    Computation Structures