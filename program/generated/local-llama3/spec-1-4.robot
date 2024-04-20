*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Login As Student
  Open Browser  chrome
  Set Browser Implicit Wait  10
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Element Is Not Visible  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  brown
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Wait Until Element Is Visible  xpath://*[@id="header.title.userHome"]
  Element Text Should Be  xpath://*[@id="header.title.userHome"]  Noah Brown
  Element Should Be Visible  xpath://*[@id="header.link.logout"]
  Element Should Be Visible  xpath://*[@id="header.student-view-nav"]
  Element Text Should Be  xpath://*[@id="stu.view.title"]  Student's View
  Element Should Be Visible  xpath://*[@id="overview.personalInfoForm"]
  Close Browser

Login As Teacher
  Open Browser  chrome
  Set Browser Implicit Wait  10
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Element Is Not Visible  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  lazy
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Wait Until Element Is Visible  xpath://*[@id="header.title.userHome"]
  Element Text Should Be  xpath://*[@id="header.title.userHome"]  John Lazy
  Element Should Be Visible  xpath://*[@id="header.link.logout"]
  Element Should Be Visible  xpath://*[@id="header.teacher-view-nav"]
  Element Text Should Be  xpath://*[@id="tea.view.title"]  Teacher's View
  Element Should Be Visible  xpath://*[@id="overview.personalInfoForm"]
  Close Browser

Login With Invalid Credentials
  Open Browser  chrome
  Set Browser Implicit Wait  10
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Element Is Not Visible  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  bla
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Element Should Be Visible  xpath://*[@id="loginPage.errorAlert"]
  Close Browser
  Open Browser  chrome
  Set Browser Implicit Wait  10
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Element Is Not Visible  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  lazy
  Input Text  xpath://*[@id="loginPage.passwordInput"]  bla
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Element Should Be Visible  xpath://*[@id="loginPage.errorAlert"]
  Close Browser