*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close Browser

*** Variables ***
${BROWSER}  Chrome
${DELAY}  0.5

*** Test Cases ***
Spec 9
  Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
  Set Window Size  1501  1104
  Sleep  ${DELAY}
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
  ${participants_td}=  Get Webelements  xpath://*[@id="stu.myExamDates.participantsModal"]//td
  ${participants}=  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
  ${participants_found}=  Create List
  FOR  ${td}  IN  @{participants_td}
  ${td_text}=  Get Text  ${td}
  FOR  ${participant}  IN  @{participants}
  IF  '${td_text}' == '${participant}'
  Append To List  ${participants_found}  ${participant}
  END
  END
  Lists Should Be Equal  ${participants_found}  ${participants}