*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${BROWSER}  Chrome
*** Test Cases ***
Teacher
    Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
    Set Window Size  1501  1104
    Click Element  xpath://*[@id="header.link.login"]
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  scatterbrained
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="tea.menu.myExamDates"]
    Click Element  xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep  1
    Click Element  xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
    Sleep  1
    Click Element  xpath://*[@id="tea.menu.setEvaluation"]
    Click Element  xpath://*[@id="tea.menu.evaluationTable"]
    Click Element  xpath://*[@id="tea.evalTable.filter.subjectSelect"]
    Click Element  xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[1]
    Click Element  xpath://*[@id="tea.evalTable.filter.submitButton"]
    Element Should Contain  xpath://*[@id="tea.evalTable.filter.submitButton"]/../../..  No exam dates for this subject
    Element Should Be Visible  xpath://*[@id="tea.myExamDates.successAlert"]
    Element Should Be Visible  xpath://*[@id="tea.setEvaluation.form.noRecords"]
    Close Browser
Student
    Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
    Set Window Size  1501  1104
    Click Element  xpath://*[@id="header.link.login"]
    Click Element  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Click Element  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="stu.menu.myExamDates"]
    Element Should Not Contain  xpath://*[@id="stu.menu.myExamDates"]/../../..  Computation Structures
    Close Browser