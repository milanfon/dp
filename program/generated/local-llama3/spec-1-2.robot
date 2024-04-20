*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${BROWSER}  chrome
${DELAY}  2 seconds
*** Test Cases ***
Scenario 1
  Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
  Maximize Browser Window
  Click Element  xpath://*[@id="header.link.login"]
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.userNameInput"]  brown
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Sleep  ${DELAY}
  Wait Until Page Contains  Student's View
  Element Should Not Be Visible  xpath://*[@id="header.link.login"]
  Element Should Contain  xpath://*[@id="header.title.userHome"]  Noah Brown
  Element Should Be Visible  xpath://*[@id="header.link.logout"]
  Element Should Be Visible  xpath://*[@id="header.student-view-nav"]
  Element Should Contain  xpath://*[@id="stu.view.title"]  Student's View
  Element Should Be Visible  xpath://*[@id="overview.personalInfoForm"]
  Close Browser
Scenario 2
  Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
  Maximize Browser Window
  Click Element  xpath://*[@id="header.link.login"]
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.userNameInput"]  lazy
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Sleep  ${DELAY}
  Wait Until Page Contains  Teacher's View
  Element Should Not Be Visible  xpath://*[@id="header.link.login"]
  Element Should Contain  xpath://*[@id="header.title.userHome"]  John Lazy
  Element Should Be Visible  xpath://*[@id="header.link.logout"]
  Element Should Be Visible  xpath://*[@id="header.teacher-view-nav"]
  Element Should Contain  xpath://*[@id="tea.view.title"]  Teacher's View
  Element Should Be Visible  xpath://*[@id="overview.personalInfoForm"]
  Close Browser
Scenario 3
  Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
  Maximize Browser Window
  Click Element  xpath://*[@id="header.link.login"]
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.userNameInput"]  bla
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Sleep  ${DELAY}
  Element Should Be Visible  xpath://*[@id="loginPage.errorAlert"]
  Close Browser
  Open Browser  http://localhost:4680/tbuis/index.jsp  ${BROWSER}
  Maximize Browser Window
  Click Element  xpath://*[@id="header.link.login"]
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.userNameInput"]  lazy
  Sleep  ${DELAY}
  Input Text  xpath://*[@id="loginPage.passwordInput"]  bla
  Sleep  ${DELAY}
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Sleep  ${DELAY}
  Element Should Be Visible  xpath://*[@id="loginPage.errorAlert"]
  Close Browser