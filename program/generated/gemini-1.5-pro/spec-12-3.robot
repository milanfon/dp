*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${BASE URL}       http://localhost:4680/tbuis
${BROWSER}        chrome

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

*** Test Cases ***
Cancel Exam Date
    Open Login Page
    Login As Teacher
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s
    Click Button    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Alert Should Be Present
    Handle Alert    Accept
    Sleep    2s
    Location Should Be    ${BASE URL}/tbuis/teacher-view/myExamDates
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    2s
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    1s
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Sleep    1s
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s
    Page Should Contain    No exam dates for this subject
    Sleep    2s
    Close Browser

Check Exam Dates As Student
    Open Login Page
    Login As Student
    Click Link    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    2s
    Page Should Not Contain    Computation Structures
    Sleep    2s
    Close Browser 
