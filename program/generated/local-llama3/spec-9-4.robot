*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome  http://localhost:4680/tbuis/index.jsp
Suite Teardown  Close Browser

*** Test Cases ***
Spec 9
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Click Element  xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
  Sleep  1
  Element Should Be Visible  xpath://*[@id="stu.myExamDates.participantsModal.title"]
  Sleep  1
  ${elements}=  Get WebElements  xpath://*[@role="gridcell"]/td
  ${values}=  Get WebElements  xpath://*[@role="gridcell"]/td
  ${values_list}=  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
  : FOR  ${element}  IN  @{values}
  \  ${text}=  Get Text  ${element}
  \  Should Contain  ${values_list}  ${text}
  \  Sleep  0.5
  : END
  Sleep  5