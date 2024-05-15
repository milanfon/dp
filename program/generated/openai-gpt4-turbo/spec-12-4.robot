*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_DRIVER_PATH}    chromedriver  # Update path as necessary

*** Test Cases ***
Teacher Scenarios
    Open Browser To Main Page
    Login As Teacher
    Navigate To My Exam Dates
    Cancel Exam And Handle Alert
    Verify Success Alert On My Exam Dates Page
    Navigate To Set Evaluation
    Verify No Records On Set Evaluation Page
    Navigate To Evaluation Table
    Select Subject And Filter
    Verify Filtered Result
    Close Browser

Student Scenarios
    Open Browser To Main Page
    Login As Student
    Navigate To My Exam Dates
    Verify Computation Structures Not Present
    Close Browser

*** Keywords ***
Open Browser To Main Page
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome    executable_path=${CHROME_DRIVER_PATH}
    Set Window Size    1501    1104
    Sleep    2s

Login As Teacher
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.passwordInput"]
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Navigate To My Exam Dates
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Sleep    2s

Cancel Exam And Handle Alert
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    1s
    Handle Alert    accept
    Sleep    2s

Verify Success Alert On My Exam Dates Page
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.successAlert"]

Navigate To Set Evaluation
    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep    2s

Verify No Records On Set Evaluation Page
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noRecords"]

Navigate To Evaluation Table
    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep    2s

Select Subject And Filter
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Sleep    1s
    Select From List By Value    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Sleep    1s
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep    2s

Verify Filtered Result
    Page Should Contain    No exam dates for this subject

Login As Student
    Go To    http://localhost:4680/tbuis/login
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Navigate To My Exam Dates As Student
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Sleep    2s

Verify Computation Structures Not Present
    Page Should Not Contain    Computation Structures