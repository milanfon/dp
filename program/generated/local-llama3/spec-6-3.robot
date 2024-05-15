*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome  http://localhost:4680/tbuis/index.jsp
Suite Teardown  Close Browser

*** Variables ***
${DELAY}  1 second

*** Test Cases ***
Student Scenario
  Set Viewport  1501  1104
  Navigate  http://localhost:4680/tbuis/index.jsp
  Click  xpath://*[@id="header.link.login"]
  Click  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  maroon
  Click  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click  xpath://*[@id="loginPage.loginFormSubmit"]
  Click  xpath://*[@id="stu.menu.otherSubjects"]
  Click  xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
  Wait Until Element Is Visible  xpath://*[@id="stu.otherSubjects.successAlert"]
  Click  xpath://*[@id="stu.menu.mySubjects"]
  Wait Until Element Is Visible  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
  Wait Until Element Is Visible  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1][contains(text(), "Software Quality Assurance")]
  Wait Until Element Is Visible  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2][contains(text(), "Peter Strict")]
  Close Browser

Teacher Scenario
  Open Browser  chrome  http://localhost:4680/tbuis/index.jsp
  Set Viewport  1501  1104
  Navigate  http://localhost:4680/tbuis/index.jsp
  Click  xpath://*[@id="header.link.login"]
  Click  xpath://*[@id="loginPage.userNameInput"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Click  xpath://*[@id="loginPage.passwordInput"]
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click  xpath://*[@id="loginPage.loginFormSubmit"]
  Click  xpath://*[@id="tea.menu.mySubjects"]
  Click  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
  Wait Until Element Is Visible  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"][contains(text(), "Students (2)")]
  Wait Until Element Is Visible  xpath://td[contains(text(), "William Maroon")]
  Close Browser