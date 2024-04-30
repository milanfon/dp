*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${BASE URL}       http://localhost:4680/tbuis/
${BROWSER}        chrome
${DELAY}          2s

*** Keywords ***
Login Teacher
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    
Login Student
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Go To My Exam Dates
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}

Go To Set Evaluation
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}

Go To Evaluation Table
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}

Cancel Exam Date
    Click Button    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    ${DELAY}
    Alert Should Be Present
    Handle Alert    Accept
    Sleep    ${DELAY}
    Location Should Be    ${BASE URL}teacher-view/myExamDates
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="tea.myExamDates.successAlert"]
    Sleep    ${DELAY}

Check Set Evaluation
    Element Should Be Visible    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    ${DELAY}

Filter Evaluation Table
    Select From List By Index    xpath://*[@id="tea.evalTable.filter.subjectSelect"]    0
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}
    Page Should Contain    No exam dates for this subject
    Sleep    ${DELAY}

*** Test Cases ***
Teacher
    Login Teacher
    Go To My Exam Dates
    Cancel Exam Date
    Go To Set Evaluation
    Check Set Evaluation
    Go To Evaluation Table
    Filter Evaluation Table
    Close Browser
    
Student
    Login Student
    Go To My Exam Dates
    Page Should Not Contain    Computation Structures
    Close Browser
