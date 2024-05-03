*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  http://localhost:4680/tbuis/  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Student
  Set Browser Implicit Wait  10
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  green
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Sleep  2
  Click Element  xpath://*[@id="stu.menu.otherExamDates"]
  Sleep  2
  Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
  Sleep  2
  Element Should Be Visible  xpath://*[@id="stu.otherExamDates.successAlert"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Sleep  2
  Element Should Contain  xpath://*[@id="stu.myExamDates.table.examDatesTable"]/tbody/tr/td  Programming in Java
  Sleep  2
  Close Browser
  Sleep  2
  Open Browser  http://localhost:4680/tbuis/  chrome
  Sleep  2
  Set Browser Implicit Wait  10
  Set Window Size  1501  1104

Teacher
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Sleep  2
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Sleep  2
  Click Element  xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
  Sleep  2
  Element Should Contain  xpath://*[@id="tea.myExamDates.table.participantsTable"]/tbody/tr/td  Mia Orange
  Sleep  2