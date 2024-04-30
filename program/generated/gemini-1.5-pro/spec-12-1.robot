*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp
${teacher_login}  scatterbrained
${teacher_pass}   pass
${student_login}  orange
${student_pass}   pass

*** Keywords ***
Open Login Page
    Open Browser    ${url}    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s

Login As Teacher
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${teacher_login}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${teacher_pass}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Login As Student
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${student_login}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${student_pass}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Open My Exam Dates Page
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    2s

Cancel Exam
    Click Element    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Alert Should Be Present
    Handle Alert    Accept

Open Set Evaluation Page
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    2s

Open Evaluation Table Page
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    2s

Select Subject
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    1202

Filter
    Click Element    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s

Check If Text Is Not Present
    Page Should Not Contain    ${text}

*** Test Cases ***
Cancel Exam And Check Alert
    Open Login Page
    Login As Teacher
    Open My Exam Dates Page
    Cancel Exam
    Location Should Be    http://localhost:4680/tbuis/teacher-view/myExamDates
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Close Browser

Check Set Evaluation Page
    Open Login Page
    Login As Teacher
    Open Set Evaluation Page
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Close Browser

Filter Evaluation Table
    Open Login Page
    Login As Teacher
    Open Evaluation Table Page
    Select Subject
    Filter
    Page Should Contain    No exam dates for this subject
    Close Browser

Check My Exam Dates As Student
    Open Login Page
    Login As Student
    Open My Exam Dates Page
    ${text}=    Computation Structures
    Check If Text Is Not Present
    Close Browser
