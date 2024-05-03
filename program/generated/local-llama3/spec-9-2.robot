*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close Browser
*** Variables ***
${BROWSER}  Chrome
${DELAY}  2 seconds
*** Test Cases ***
Spec 9
  Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
  Sleep  ${DELAY}
  Element Should Be Visible  xpath://*[@id="stu.myExamDates.participantsModal.title"]
  Sleep  ${DELAY}
  ${participants}  Get Webelements  xpath://*[@id="stu.myExamDates.participantsModal"]//td
  Sleep  ${DELAY}
  ${participants_values}  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
  Sleep  ${DELAY}
  :FOR  ${participant}  IN  @{participants}
  \  ${participant_text}  Get Text  ${participant}
  \  Should Contain  ${participant_text}  @{participants_values}
  Sleep  ${DELAY}