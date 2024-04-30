*** Settings ***
Library           SeleniumLibrary
Documentation     This is an example test suite.

*** Variables ***
${BROWSER}         chrome
${DELAY}           2s

*** Test Cases ***
My exam date teacher
    Open Browser To Login Page
    Input Username
    Input Password
    Submit Credentials
    Go To My Exam Dates Page
    Cancel Exam Date
    Check Exam Date Cancellation
    Go To Set Evaluation Page
    Check Records
    Go To Evaluation Table Page
    Filter Subject
    Check No Exam Dates

My exam date student
    Open Browser To Login Page
    Input Username Student
    Input Password Student
    Submit Credentials Student
    Go To My Exam Dates Page Student
    Check No Computation Structures

*** Keywords ***
Open Browser To Login Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]

Input Username
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained

Input Password
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass

Submit Credentials
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Go To My Exam Dates Page
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]

Cancel Exam Date
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    ${DELAY}
    Handle Alert    Accept

Check Exam Date Cancellation
    Sleep    ${DELAY}
    Location Should Be    http://localhost:4680/tbuis/teacher-view/myExamDates
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]

Go To Set Evaluation Page
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]

Check Records
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]

Go To Evaluation Table Page
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]

Filter Subject
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    ${DELAY}
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]

Check No Exam Dates
    Sleep    ${DELAY}
    Page Should Contain    No exam dates for this subject
    Close Browser

Input Username Student
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange

Input Password Student
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass

Submit Credentials Student
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]

Go To My Exam Dates Page Student
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="stu.menu.myExamDates"]

Check No Computation Structures
    Sleep    ${DELAY}
    Page Should Not Contain    Computation Structures
    Close Browser 
