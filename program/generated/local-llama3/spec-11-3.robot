*** Settings ***
Library  SeleniumLibrary
Library  SeleniumSpeed  speed=2
Suite Setup  Open Browser  chrome  executable_path=/path/to/chromedriver
Suite Teardown  Close Browser

*** Test Cases ***
Check Students
  Open Page
  Check Names
  Click Button  xpath=//*[@id="closeModalButtonCross"]
  Click Button  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
  Page Should Contain  No students

*** Keywords ***
Open Page
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Button  xpath=//*[@id="header.link.login"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  pedant
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
  Click Button  xpath=//*[@id="loginPage.loginFormSubmit"]
  Click Button  xpath=//*[@id="tea.menu.mySubjects"]
  Click Button  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
  Sleep  2  # wait for the page to load

Check Names
  Sleep  2  # wait for the page to load
  Page Should Contain  Benjamin Green
  Page Should Contain  Mia Orange
  Page Should Contain  Charlotte Purple
  Page Should Contain  Isabella Yellow
  Sleep  2  # wait for the page to load