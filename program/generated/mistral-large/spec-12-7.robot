*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Teacher Scenario
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Maximize Browser Window

    # Login as teacher
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  scatterbrained
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Button  xpath=//*[@id="loginPage.loginFormSubmit"]

    # My Exam Dates page
    Click Element  xpath=//*[@id="tea.menu.myExamDates"]
    Sleep  2s
    Click Element  xpath=//*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep  2s
    Accept Alert
    Sleep  2s
    Page Should Contain  My Exam Dates
    Element Should Be Visible  xpath=//*[@id="tea.myExamDates.successAlert"]
    Sleep  2s

    # Set Evaluation page
    Click Element  xpath=//*[@id="tea.menu.setEvaluation"]
    Sleep  2s
    Element Should Be Visible  xpath=//*[@id="tea.setEvaluation.form.noRecords"]
    Sleep  2s

    # Evaluation Table page
    Click Element  xpath=//*[@id="tea.menu.evaluationTable"]
    Sleep  2s
    Select From List By Value  xpath=//*[@id="tea.evalTable.filter.subjectSelect"]  1202
    Sleep  2s
    Click Element  xpath=//*[@id="tea.evalTable.filter.submitButton"]
    Sleep  2s
    Page Should Contain  No exam dates for this subject
    Sleep  2s

    Close Browser

Student Scenario
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Maximize Browser Window

    # Login as student
    Input Text  xpath=//*[@id="loginPage.userNameInput"]  orange
    Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
    Click Button  xpath=//*[@id="loginPage.loginFormSubmit"]

    # My Exam Dates page
    Click Element  xpath=//*[@id="stu.menu.myExamDates"]
    Sleep  2s
    Page Should Not Contain  Computation Structures
    Sleep  2s

    Close Browser
