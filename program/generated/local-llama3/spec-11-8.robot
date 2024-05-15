*** Settings ***
Library  SeleniumLibrary  speed=2
Suite Setup  Open Browser  chrome  http://localhost:4680/tbuis/index.jsp
Suite Teardown  Close Browser

*** Test Cases ***
Check Student Names
  Set Window Size  1501  1104
  Click Element  xpath=//*[@id="header.link.login"]
  Click Element  xpath=//*[@id="loginPage.userNameInput"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  pedant
  Click Element  xpath=//*[@id="loginPage.passwordInput"]
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath=//*[@id="tea.menu.mySubjects"]
  Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-0"]
  ${names}  Create List  Benjamin Green  Mia Orange  Charlotte Purple  Isabella Yellow
  FOR  ${name}  IN  ${names}
    Page Should Contain  ${name}
  END
  Click Element  xpath=//*[@id="closeModalButtonCross"]
  Click Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-2"]
  Page Should Contain  No students
  Sleep  2s  # add delay for 2 seconds