*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome
Suite Teardown  Close Browser

*** Variables ***
${DELAY}  2 seconds

*** Test Cases ***
Spec 6 Student
  Open Browser  chrome
  Go To  http://localhost:4680/tbuis/index.jsp
  Wait Until Page Contains  University information system
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Page Contains  Login Page
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  maroon
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Wait Until Page Contains  Student's View
  Click Element  xpath://*[@id="stu.menu.otherSubjects"]
  Wait Until Page Contains  Student's View
  Click Element  xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
  Wait Until Page Contains Element  id=stu.otherSubjects.successAlert
  Click Element  xpath://*[@id="stu.menu.mySubjects"]
  Wait Until Page Contains  Student's View
  Element Should Contain  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td  Software Quality Assurance
  Element Should Contain  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td  Peter Strict
  Close Browser

Spec 6 Teacher
  Open Browser  chrome
  Go To  http://localhost:4680/tbuis/index.jsp
  Wait Until Page Contains  University information system
  Click Element  xpath://*[@id="header.link.login"]
  Wait Until Page Contains  Login Page
  Click Element  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Click Element  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Wait Until Page Contains  Teacher's View
  Click Element  xpath://*[@id="tea.menu.mySubjects"]
  Wait Until Page Contains  Teacher's View
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]  Students (2)
  Wait Until Page Contains Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]/td  William Maroon
  Close Browser