*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome
Suite Teardown  Close Browser

*** Variables ***
${DELAY}  1s

*** Test Cases ***
Login as Student
  Open Browser  chrome
  Go To  http://localhost:4680/tbuis/
  Click Element  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  green
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.otherExamDates"]
  Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
  Wait Until Element Is Visible  xpath://*[@id="stu.otherExamDates.successAlert"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Wait Until Element Is Visible  xpath://*[@id="stu.myExamDates.table"]//td[contains(text(), "Programming in Java")]

Login as Teacher
  Open Browser  chrome
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Click Element  xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
  Wait Until Element Is Visible  xpath://*[@id="tea.myExamDates.table"]//td[contains(text(), "Mia Orange")]

*** Keywords ***
Open Browser
  [Arguments]  ${browser}
  Open Browser  ${browser}  ${DELAY}
  Set Window Size  1500  1100

Wait Until Element Is Visible
  [Arguments]  ${xpath}
  Wait Until Element Is Visible  ${xpath}  ${DELAY}