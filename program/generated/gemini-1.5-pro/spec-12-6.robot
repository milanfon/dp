*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${BASE URL}       http://localhost:4680/tbuis
${BROWSER}        chrome
${DELAY}          2s

*** Test Cases ***
Teacher Cancels Exam Date And Student Doesnt See It Anymore
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    
    Login As Teacher    scatterbrained    pass
    Cancel Exam Date
    Check If Canceling Worked
    
    Go To Set Evaluation Page
    Check If Set Evaluation Page Works
    
    Go To Evaluation Table Page
    Filter Subject
    Check If Filtering Works
    
    [Teardown]    Close Browser

Student Doesnt See Canceled Exam Date
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    
    Login As Student    orange    pass
    Go To My Exam Dates Page
    Check If Exam Date Is Canceled

*** Keywords ***
Login As Teacher
    [Arguments]    ${USERNAME}    ${PASSWORD}
    
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME}
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Cancel Exam Date
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    ${DELAY}
    Alert Should Be Present
    Handle Alert    Accept

Check If Canceling Worked
    Location Should Be    ${BASE URL}/teacher-view/myExamDates
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.successAlert"]
    Sleep    ${DELAY}

Go To Set Evaluation Page
    Click Link    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    ${DELAY}

Check If Set Evaluation Page Works
    Location Should Be    ${BASE URL}/teacher-view/setEvaluation
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Sleep    ${DELAY}

Go To Evaluation Table Page
    Click Link    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    ${DELAY}

Filter Subject
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[1]
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="tea.evalTable.filter.submitButton"]
    Sleep    ${DELAY}

Check If Filtering Works
    Location Should Be    ${BASE URL}/teacher-view/evaluationTable?filterSubjectId=1202
    Sleep    ${DELAY}
    Page Should Contain    No exam dates for this subject

Login As Student
    [Arguments]    ${USERNAME}    ${PASSWORD}
    
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${USERNAME}
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep    ${DELAY}
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Go To My Exam Dates Page
    Click Link    xpath://*[@id="stu.menu.myExamDates"]
    Sleep    ${DELAY}

Check If Exam Date Is Canceled
    Location Should Be    ${BASE URL}/student-view/myExamDates
    Sleep    ${DELAY}
    Page Should Not Contain    Computation Structures 
    Sleep    ${DELAY} 
