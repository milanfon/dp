*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Student Scenario
  Open Browser  chrome
  Set Window Size  1501  1104
  Navigate  http://localhost:4680/tbuis/
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  green
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.otherExamDates"]
  Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
  Sleep  2
  Page Should Contain Element  xpath://*[@id="stu.otherExamDates.successAlert"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Page Should Contain Element  xpath://td[text()="Programming in Java"]
  Close Browser

Teacher Scenario
  Open Browser  chrome
  Set Window Size  1501  1104
  Navigate  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Click Element  xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
  Page Should Contain Element  xpath://td[text()="Mia Orange"]
  Close Browser