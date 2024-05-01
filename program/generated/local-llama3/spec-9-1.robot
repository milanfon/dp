*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${EMPTY}  Chrome
Suite Teardown  Close Browser

*** Test Cases ***
Spec 9
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Sleep  1
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
  Element Should Be Visible  xpath://*[@id="stu.myExamDates.participantsModal.title"]
  Sleep  1
  ${participants}=  Get WebElements  xpath://*[@id="stu.myExamDates.participantsModal"]/table/tbody/tr/td
  ${participants_names}=  Create List
  FOR  ${participant}  IN  @{participants}
  ${participant_text}=  Get Text  ${participant}
  Append To List  ${participants_names}  ${participant_text}
  END
  List Should Contain Value  ${participants_names}  Benjamin Green
  List Should Contain Value  ${participants_names}  Mia Orange
  List Should Contain Value  ${participants_names}  Charlotte Purple
  List Should Contain Value  ${participants_names}  Isabella Yellow
  Sleep  1