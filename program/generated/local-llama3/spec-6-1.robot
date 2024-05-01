*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Spec 6 Student
  Open Page  http://localhost:4680/tbuis/index.jsp
  Set Viewport  1501  1104
  Click  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  maroon
  Input Password  xpath://*[@id="loginPage.passwordInput"]  pass
  Click  xpath://*[@id="loginPage.loginFormSubmit"]
  Click  xpath://*[@id="stu.menu.otherSubjects"]
  Click  xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
  Wait Until Page Contains Element  xpath://*[@id="stu.otherSubjects.successAlert"]
  Click  xpath://*[@id="stu.menu.mySubjects"]
  Wait Until Page Contains Element  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td  Software Quality Assurance
  Wait Until Page Contains Element  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td  Peter Strict
  Sleep  2

Spec 6 Teacher
  Open Page  http://localhost:4680/tbuis/index.jsp
  Set Viewport  1501  1104
  Click  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Input Password  xpath://*[@id="loginPage.passwordInput"]  pass
  Click  xpath://*[@id="loginPage.loginFormSubmit"]
  Click  xpath://*[@id="tea.menu.mySubjects"]
  Click  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
  Wait Until Page Contains Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]  Students (2)
  Wait Until Page Contains Element  xpath://*[@id="tea.mySubjects.table.listOfStudents"]//td  William Maroon
  Sleep  2