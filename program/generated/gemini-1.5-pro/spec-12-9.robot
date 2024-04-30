*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Test Teardown     Close Browser

*** Variables ***
${LOGIN_URL}      http://localhost:4680/tbuis/login

*** Keywords ***
Login Teacher
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    scatterbrained
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Login Student
    Click Element    xpath///*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath///*[@id="loginPage.userNameInput"]
    Input Text    xpath///*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath///*[@id="loginPage.passwordInput"]
    Input Text    xpath///*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath///*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Cancel Exam Date
    Click Element    xpath///*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Element    xpath///*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Alert Should Be Present
    Handle Alert    Accept

Check Set Evaluation Page
    Click Element    xpath///*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Element Should Be Visible    xpath///*[@id="tea.setEvaluation.form.noRecords"]

Check Evaluation Table Page
    Click Element    xpath///*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Click Element    xpath///*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath///*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Element    xpath///*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject

Check Student Exam Date Page
    Click Element    xpath///*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    Computation Structures

*** Test Cases ***
Teacher Cancels Exam Date
    Login Teacher
    Cancel Exam Date
    Check Set Evaluation Page
    Check Evaluation Table Page

Student Cannot See Canceled Exam Date
    Go To    ${LOGIN_URL}
    Login Student
    Check Student Exam Date Page
