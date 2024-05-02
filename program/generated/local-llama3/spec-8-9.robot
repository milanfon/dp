*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close Browser

*** Test Cases ***
Student
  Open Browser  http://localhost:4680/tbuis/  Chrome
  Set Browser Implicit Wait  10
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  green
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.otherExamDates"]
  Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
  Sleep  2
  Element Should Be Visible  xpath://*[@id="stu.otherExamDates.successAlert"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Sleep  2
  Element Should Be Visible  xpath://*[@text="Programming in Java"]/parent::td
  Close Browser

Teacher
  Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
  Set Browser Implicit Wait  10
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Click Element  xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
  Sleep  2
  Element Should Be Visible  xpath://*[@text="Mia Orange"]/parent::td
  Close Browser