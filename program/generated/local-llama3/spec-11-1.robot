*** Settings ***
Library  SeleniumLibrary
Library  SeleniumSpeed  speed=2

*** Variables ***
${BROWSER}  Chrome
${DELAY}  2

*** Test Cases ***
Check Students
  Open Browser  ${BROWSER}
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Wait Until Page Contains  University information system
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Page Contains  Login Page
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Wait Until Page Contains  
  Click Element  xpath://*[@id="tea.menu.mySubjects"]
  Wait Until Page Contains  Teacher's View
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
  Wait Until Page Contains  Benjamin Green
  Wait Until Page Contains  Mia Orange
  Wait Until Page Contains  Charlotte Purple
  Wait Until Page Contains  Isabella Yellow
  Click Element  xpath://*[@id="closeModalButtonCross"]
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
  Wait Until Page Contains  No students
  Close Browser

*** Keywords ***