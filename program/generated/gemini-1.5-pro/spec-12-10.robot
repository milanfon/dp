*** Settings ***
Library           SeleniumLibrary
Documentation     Teacher cancels exam date, student doesn't see cancelled exam date

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${BASE URL}       http://localhost:4680/tbuis/
${TEACHER}        scatterbrained
${STUDENT}        orange
${PASSWORD}       pass
${BROWSER}        chrome

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window

Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    2s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${STUDENT}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    2s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Go To My Exam Dates Page As Teacher
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s

Go To My Exam Dates Page As Student
    Click Link    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s

Go To Set Evaluation Page
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s

Go To Evaluation Table Page
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s

Cancel Exam Date
    Click Button    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Alert Should Be Present
    Accept Alert

Filter Subjects
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s

*** Test Cases ***
Teacher Cancels Exam Date, Student Does Not See Cancelled Exam Date
    Open Login Page
    Login As Teacher
    Go To My Exam Dates Page As Teacher
    Cancel Exam Date
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Go To Set Evaluation Page
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Go To Evaluation Table Page
    Filter Subjects
    Page Should Contain    No exam dates for this subject
    Close Browser
    Open Login Page
    Login As Student
    Go To My Exam Dates Page As Student
    Page Should Not Contain    Computation Structures
    Close Browser
