*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Login And Actions
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # Perform actions as teacher
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep    2s
    Accept Alert
    ${page_title}    Get Title
    Should Contain    ${page_title}    Teacher's View
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.successAlert"]

    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    ${no_records}    Get Text    xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Should Be Equal As Strings    ${no_records}    No records to display

    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Index    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    1
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    ${no_exam_dates}    Get Text    xpath=//*[contains(text(), "No exam dates for this subject")]
    Should Be Equal As Strings    ${no_exam_dates}    No exam dates for this subject

    Close Browser

Student Login And Actions
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # Perform actions as student
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    ${comp_structures}    Get Text    xpath=//*[contains(text(), "Computation Structures")]
    Should Not Be Equal As Strings    ${comp_structures}    Computation Structures

    Close Browser
