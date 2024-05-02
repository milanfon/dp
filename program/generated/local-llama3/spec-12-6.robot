*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${BROWSER}  Chrome
${DELAY}  0.5
*** Test Cases ***
Teacher
  Open Browser  ${BROWSER}
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  scatterbrained
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Click Element  xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="tea.myExamDates.table.cancelButton-0-0"]/../../following-sibling::*[1]
  Click Element  xpath://*[@id="tea.menu.setEvaluation"]
  Click Element  xpath://*[@id="tea.menu.evaluationTable"]
  Click Element  xpath://*[@id="tea.evalTable.filter.subjectSelect"]
  Click Element  xpath://*[@id="tea.evalTable.filter.subjectSelect"]/option[1]
  Click Element  xpath://*[@id="tea.evalTable.filter.submitButton"]
  Sleep  ${DELAY}
  Page Should Contain  No exam dates for this subject
  Sleep  ${DELAY}
  Page Should Contain  No exam dates for this subject
  Close Browser
Student
  Open Browser  ${BROWSER}
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Sleep  ${DELAY}
  Page Should Not Contain  Computation Structures
  Close Browser