*** Settings ***
Library           SeleniumLibrary
Documentation     This is teacher spec 12
...               This spec tests deleting exam dates from teacher view,
...               setting evaluation and filtering evaluation table.
Test Teardown     Close Browser

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${ROOT URL}       http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome

*** Test Cases ***
Teacher delete exam date, set evaluation and filter table
    Open Browser    ${ROOT URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    1s
    Handle Alert    Accept
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    1s
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Sleep    1s
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject

*** Settings ***
Library           SeleniumLibrary
Documentation     This is student spec 12
...               This spec tests if student can't see subjects with
...               no exam dates assigned.
Test Teardown     Close Browser

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${ROOT URL}       http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome

*** Test Cases ***
Student can't see subject with no exam date
    Open Browser    ${ROOT URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    Computation Structures 
