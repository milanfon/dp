*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # Perform actions as teacher
    Click Element    xpath=//*[@id="tea.menu.myExamDates"]
    Click Element    xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Accept Alert
    ${page_title} =    Get Title
    Should Be Equal    ${page_title}    Teacher's View
    Page Should Contain Element    xpath=//*[@id="tea.myExamDates.successAlert"]

    Click Element    xpath=//*[@id="tea.menu.setEvaluation"]
    Page Should Contain Element    xpath=//*[@id="tea.setEvaluation.form.noRecords"]

    Click Element    xpath=//*[@id="tea.menu.evaluationTable"]
    Click Element    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
    Select From List By Value    xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Element    xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject

    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # Perform actions as student
    Click Element    xpath=//*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures

    Close Browser
