*** Settings ***
Library  SeleniumLibrary
Suite Teardown  Close Browser

*** Variables ***
${BROWSER}  Chrome
${DELAY}  1 second

*** Test Cases ***
Login as Teacher
  Open Browser  ${BROWSER}
  Set Browser Implicit Wait  ${DELAY}
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="tea.menu.otherSubjects"]
  Click Element  xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
  Element Should Be Visible  xpath://*[@id="tea.otherSubjects.successAlert"]
  Element Should Be Visible  xpath://*[@id="tea.otherSubjects.table"]
  Click Element  xpath://*[@id="tea.menu.myExamDates"]
  Page Should Contain  Linear Algebra
  Element Should Be Visible  xpath://*[@id="tea.myExamDates.table.noRecords-2"]
  Click Element  xpath://*[@id="tea.menu.newExamDates"]
  Element Should Be Visible  xpath://*[@option="Linear Algebra"]
  Click Element  xpath://*[@id="tea.menu.listOfAllTeachers"]
  Element Should Be Visible  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
  Element Should Contain  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]  Linear Algebra
  Element Should Contain  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]  Alice Pedant
  Close Browser

Login as Student
  Open Browser  ${BROWSER}
  Set Browser Implicit Wait  ${DELAY}
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath://*[@id="header.link.login"]
  Input Text  xpath://*[@id="loginPage.userNameInput"]  yellow
  Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath://*[@id="stu.menu.otherSubjects"]
  Element Should Contain  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]  Linear Algebra
  Element Should Contain  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]  Alice Pedant
  Close Browser