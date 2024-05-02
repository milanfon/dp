*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${BROWSER}  ${BROWSER_ALIAS}  http://localhost:4680/tbuis/index.jsp
Suite Teardown  Close Browser
Default Timeout  10s

*** Variables ***
${BROWSER}  Chrome
${BROWSER_ALIAS}  chrome

*** Test Cases ***
Spec 9
  Set Window Size  1501  1104
  Set Window Size  1501  1104
  Click Element  xpath=//*[@id="header.link.login"]
  Sleep  1s
  Click Element  xpath=//*[@id="loginPage.userNameInput"]
  Sleep  1s
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  orange
  Sleep  1s
  Click Element  xpath=//*[@id="loginPage.passwordInput"]
  Sleep  1s
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
  Sleep  1s
  Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
  Sleep  1s
  Click Element  xpath=//*[@id="stu.menu.myExamDates"]
  Sleep  1s
  Click Element  xpath=//*[@id="stu.myExamDates.table.ParticipantsButton-1"]
  Sleep  1s
  Element Should Be Visible  xpath=//*[@id="stu.myExamDates.participantsModal.title"]
  Sleep  1s
  ${elements}  Get Webelements  xpath=//*[@id="stu.myExamDates.participantsModal"]//td
  ${values}  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
  ${found}  Create List
  FOR  ${element}  IN  @{elements}
  ${text}  Get Text  ${element}
  Run Keyword If  '${text}' in ${values}  Append To List  ${found}  ${text}
  END
  List Should Contain Sub List  ${found}  ${values}