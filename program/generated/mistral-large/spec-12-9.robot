*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}        chrome

*** Test Cases ***
Teacher Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as teacher
    Input Text      xpath=//*[@id="loginPage.userNameInput"]    scatterbrained
    Input Password  xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # My Exam Dates page
    Click Element   xpath=//*[@id="tea.menu.myExamDates"]
    Click Element   xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep   1s
    Accept Alert
    Page Should Contain Element   xpath=//*[@id="tea.myExamDates.successAlert"]
    Element Should Be Visible    xpath=//*[@id="tea.myExamDates.successAlert"]

    # Set Evaluation page
    Click Element   xpath=//*[@id="tea.menu.setEvaluation"]
    Element Should Be Visible    xpath=//*[@id="tea.setEvaluation.form.noRecords"]

    # Evaluation Table page
    Click Element   xpath=//*[@id="tea.menu.evaluationTable"]
    Select From List By Value   xpath=//*[@id="tea.evalTable.filter.subjectSelect"]    1202
    Click Element   xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Page Should Contain    No exam dates for this subject

    Close Browser

Student Scenario
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login as student
    Input Text      xpath=//*[@id="loginPage.userNameInput"]    orange
    Input Password  xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Button    xpath=//*[@id="loginPage.loginFormSubmit"]

    # My Exam Dates page
    Click Element   xpath=//*[@id="stu.menu.myExamDates"]
    Page Should Not Contain    Computation Structures

    Close Browser
