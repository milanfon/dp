*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${BROWSER}  Chrome
*** Test Cases ***
Spec 12 Teacher
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
  Sleep  0.5
  Click Element  xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
  Sleep  0.5
  Accept Alert
  Page Should Contain Element  xpath://*[@id="tea.myExamDates.successAlert"]
  Click Element  xpath://*[@id="tea.menu.setEvaluation"]
  Page Should Contain Element  xpath://*[@id="tea.setEvaluation.form.noRecords"]
  Click Element  xpath://*[@id="tea.menu.evaluationTable"]
  Click Element  xpath://*[@id="tea.evalTable.filter.subjectSelect"]
  Click Element  xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[1]
  Click Element  xpath://*[@id="tea.evalTable.filter.submitButton"]
  Page Should Contain  No exam dates for this subject
  Close Browser

Spec 12 Student
  Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Page Should Not Contain  Computation Structures
  Close Browser