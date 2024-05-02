*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome
Suite Teardown  Close Browser

*** Variables ***
${BASE_URL}  http://localhost:4680/tbuis

*** Test Cases ***
Student Login
  Open Browser  chrome
  Maximize Browser Window
  Go To  ${BASE_URL}/
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Element Is Visible  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  green
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Wait Until Element Is Visible  xpath://*[@id="stu.menu.otherExamDates"]
  Click Element  xpath://*[@id="stu.menu.otherExamDates"]
  Click Element  xpath://*[@id="stu.otherExamDates.table.registerButton-2-0"]
  Wait Until Element Is Visible  xpath://*[@id="stu.otherExamDates.successAlert"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Wait Until Element Is Visible  xpath://*[@id="stu.myExamDates.table"]
  Element Should Contain  xpath://*[@id="stu.myExamDates.table"]/tbody/tr/td  Programming in Java
  Close Browser

Teacher Login
  Open Browser  chrome
  Maximize Browser Window
  Go To  ${BASE_URL}/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Element Is Visible  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Wait Until Element Is Visible  xpath://*[@id="tea.menu.myExamDates"]
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Click Element  xpath://*[@id="tea.myExamDates.table.participantsButton-1-0"]
  Wait Until Element Is Visible  xpath://*[@id="tea.myExamDates.table"]
  Element Should Contain  xpath://*[@id="tea.myExamDates.table"]/tbody/tr/td  Mia Orange
  Close Browser