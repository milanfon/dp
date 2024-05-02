*** Settings ***
Library  SeleniumLibrary
Library  SeleniumSpeed  speed=2

*** Variables ***
${BROWSER}  Chrome
${DELAY}  2

*** Test Cases ***
University Information System
  Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
  Set Window Size  1501  1104
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.mySubjects"]
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
  Sleep  ${DELAY}
  ${names}  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
  FOR  ${name}  IN  ${names}
    Page Should Contain  ${name}
  END
  Click Element  xpath://*[@id="closeModalButtonCross"]
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
  Page Should Contain  No students
  Close Browser