*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome  http://localhost:4680/tbuis/index.jsp
Suite Teardown  Close Browser

*** Test Cases ***
Spec 9
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Sleep  1
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Sleep  1
  Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
  Sleep  1
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Sleep  1
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Sleep  1
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Sleep  1
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Sleep  1
  Click Element  xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
  Sleep  1
  Wait Until Element Is Visible  xpath://*[@id="stu.myExamDates.participantsModal.title"]
  Sleep  1
  ${participants}  Get WebElements  xpath://*[@id="stu.myExamDates.participantsModal"]//td
  ${participants_values}  Create List
  FOR  ${participant}  IN  @{participants}
  ${value}  Get Text  ${participant}
  Append To List  ${participants_values}  ${value}
  END
  Should Contain  ${participants_values}  Benjamin Green
  Should Contain  ${participants_values}  Mia Orange
  Should Contain  ${participants_values}  Charlotte Purple
  Should Contain  ${participants_values}  Isabella Yellow
  Sleep  1