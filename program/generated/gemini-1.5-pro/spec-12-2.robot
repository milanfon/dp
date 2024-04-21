*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${TEACHER USER}   scatterbrained
${STUDENT USER}   orange
${PASSWORD}       pass

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    chrome
    Maximize Browser Window

Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER USER}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${STUDENT USER}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]

Cancel Exam
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Click Button    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Alert Should Be Present
    Handle Alert    Accept

Check No Records
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]

Filter Evaluation Table
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Wait Until Page Contains    No exam dates for this subject

Check Student Exam Dates
    Click Link    xpath://*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures

*** Test Cases ***
Spec 12 Teacher
    Open Login Page
    Login As Teacher
    Cancel Exam
    Check No Records
    Filter Evaluation Table
    Close Browser

Spec 12 Student
    Open Login Page
    Login As Student
    Check Student Exam Dates
    Close Browser
