*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Check Names And Buttons
  # Open browser
  Open Browser  http://localhost:4680/tbuis/index.jsp  browser=chrome

  # Set browser speed
  Set Selenium Speed  2

  # Login
  Click Element  xpath://*[@id="header.link.login"]
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]

  # Click on My Subjects
  Click Element  xpath://*[@id="tea.menu.mySubjects"]
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-0"]

  # Check names
  Page Should Contain Element  xpath://*[text()="Benjamin Green"]
  Page Should Contain Element  xpath://*[text()="Mia Orange"]
  Page Should Contain Element  xpath://*[text()="Charlotte Purple"]
  Page Should Contain Element  xpath://*[text()="Isabella Yellow"]

  # Close modal
  Click Element  xpath://*[@id="closeModalButtonCross"]

  # Click on button
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-2"]

  # Check for "No students" text
  Page Should Contain  No students

  # Close browser
  Close Browser