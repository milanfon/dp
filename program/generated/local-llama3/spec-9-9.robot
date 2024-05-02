*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${BROWSER}  ${BROWSER}
Suite Teardown  Close Browser
*** Variables ***
${BROWSER}  Chrome
${DELAY}  1
*** Test Cases ***
Spec 9
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Wait Until Page Contains  University information system
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Page Contains  Login Page
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Wait Until Page Contains  
  Click Element  xpath://*[@id="stu.menu.myExamDates"]
  Wait Until Page Contains  
  Click Element  xpath://*[@id="stu.myExamDates.table.ParticipantsButton-1"]
  Sleep  ${DELAY}
  Page Should Contain Element  xpath://*[@id="stu.myExamDates.participantsModal.title"]
  ${td_elements}=  Get Webelements  xpath://td
  ${td_values}=  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
  : FOR  ${td_element}  IN  @{td_elements}
  \  ${td_text}=  Get Text  ${td_element}
  \  Should Contain  ${td_text}  @{td_values}
  \  Sleep  ${DELAY}