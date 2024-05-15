*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
Suite Teardown  Close Browser

*** Test Cases ***
Student Scenario
  Set Viewport  1501  1104
  Navigate  http://localhost:4680/tbuis/index.jsp
  Click  xpath=//*[@id="header.link.login"]
  Click  xpath=//*[@id="loginPage.userNameInput"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  maroon
  Click  xpath=//*[@id="loginPage.passwordInput"]
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
  Click  xpath=//*[@id="loginPage.loginFormSubmit"]
  Click  xpath=//*[@id="stu.menu.otherSubjects"]
  Click  xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
  Wait Until Element Is Visible  xpath=//*[@id="stu.otherSubjects.successAlert"]
  Click  xpath=//*[@id="stu.menu.mySubjects"]
  Wait Until Element Is Visible  xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
  ${subjects_row}=  Get Element  xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
  ${subjects}=  Get Element  xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td  Software Quality Assurance
  ${teacher}=  Get Element  xpath=//*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td  Peter Strict
  Should Contain  ${subjects.text}  Software Quality Assurance
  Should Contain  ${teacher.text}  Peter Strict
  Sleep  2s
  Close Browser
  Open Browser  http://localhost:4680/tbuis/index.jsp  chrome

Teacher Scenario
  Set Viewport  1501  1104
  Navigate  http://localhost:4680/tbuis/index.jsp
  Click  xpath=//*[@id="header.link.login"]
  Click  xpath=//*[@id="loginPage.userNameInput"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  strict
  Click  xpath=//*[@id="loginPage.passwordInput"]
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
  Click  xpath=//*[@id="loginPage.loginFormSubmit"]
  Click  xpath=//*[@id="tea.menu.mySubjects"]
  Click  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
  Wait Until Element Is Visible  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
  ${students_button}=  Get Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
  Should Contain  ${students_button.text}  Students (2)
  Wait Until Element Is Visible  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]/td  William Maroon
  ${student}=  Get Element  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]/td  William Maroon
  Should Contain  ${student.text}  William Maroon
  Sleep  2s
  Close Browser