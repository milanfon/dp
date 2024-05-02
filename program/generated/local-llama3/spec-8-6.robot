*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close Browser

*** Variables ***
${BROWSER}  Chrome
${DELAY}  1 second

*** Test Cases ***
Login as Student
  Open Browser  ${BROWSER}  http://localhost:4680/tbuis/
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  green
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.otherExamDates"]
  Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
  Wait Until Element Is Visible  xpath://*[@id="stu.otherExamDates.successAlert"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Wait Until Element Is Visible  xpath://*[@text="Programming in Java"]/ancestor::td

Login as Teacher
  Open Browser  ${BROWSER}  http://localhost:4680/tbuis/index.jsp
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Click Element  xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
  Wait Until Element Is Visible  xpath://*[@text="Mia Orange"]/ancestor::td