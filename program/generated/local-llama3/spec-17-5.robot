*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome
Suite Teardown  Close Browser

*** Variables ***
${DELAY}  1 second

*** Test Cases ***
Teacher Login
  Open Browser  chrome
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.otherSubjects"]
  Click Element  xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
  Wait Until Element Is Visible  xpath://*[@id="tea.otherSubjects.successAlert"]
  Element Should Contain  xpath://*[@id="tea.otherSubjects.table.participateButton-3"]/../..  Others' Subjects
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Element Should Contain  xpath://*[@id="tea.myExamDates.table.noRecords-2"]/..  No exam dates.
  Element Should Contain  xpath://*[@id="tea.myExamDates.table.noRecords-2"]/..  Linear Algebra
  Click Element  xpath://*[@id="tea.menu.newExamDates"]
  Element Should Contain  xpath://*[@id="tea.newExamDates.select.subject"]/option  Linear Algebra
  Click Element  xpath://*[@id="tea.menu.listOfAllTeachers"]
  Element Should Contain  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]  Linear Algebra
  Element Should Contain  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]  Alice Pedant
  Close Browser

Student Login
  Open Browser  chrome
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  yellow
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.otherSubjects"]
  Element Should Contain  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]  Linear Algebra
  Element Should Contain  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]  Alice Pedant
  Close Browser