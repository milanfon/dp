*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
Suite Teardown  Close Browser

*** Variables ***
${DELAY}  1s

*** Test Cases ***
Student Login
  Set Browser Implicit Wait  ${DELAY}
  Click Element  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  maroon
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.otherSubjects"]
  Click Element  xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
  Wait Until Element Is Visible  xpath://*[@id="stu.otherSubjects.successAlert"]
  Click Element  xpath://*[@id="stu.menu.mySubjects"]
  Wait Until Element Is Visible  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
  Element Should Contain  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td  Software Quality Assurance
  Element Should Contain  xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td  Peter Strict
  Close Browser

Teacher Login
  Open Browser  http://localhost:4680/tbuis/index.jsp  chrome
  Set Browser Implicit Wait  ${DELAY}
  Click Element  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.mySubjects"]
  Element Should Contain  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]  Students (2)
  Click Element  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
  Wait Until Element Is Visible  xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]/../../td  William Maroon
  Close Browser