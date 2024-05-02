*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome  http://localhost:4680/tbuis/index.jsp
Suite Teardown  Close Browser

*** Variables ***
${STUDENT_USERNAME}  gray
${STUDENT_PASSWORD}  pass
${TEACHER_USERNAME}  pedant
${TEACHER_PASSWORD}  pass

*** Test Cases ***
Student Login
  Set Browser Implicit Wait  10
  Click Element  xpath=//*[@id="header.link.login"]
  Click Element  xpath=//*[@id="loginPage.userNameInput"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  ${STUDENT_USERNAME}
  Click Element  xpath=//*[@id="loginPage.passwordInput"]
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  ${STUDENT_PASSWORD}
  Click Element  xpath=//*[@id="loginPage.submitButton"]
  Click Element  xpath=//*[@id="stu.menu.mySubjects"]
  Click Element  xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
  Click Element  xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
  Element Should Be Present  xpath=//*[@id="stu.mySubjects.successAlert"]
  Element Should Be Present  xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
  Element Should Not Be Present  xpath=//*[@id="stu.mySubjects.enrolledTable"]//td[contains(text(), "Database Systems")]

Teacher Login
  Set Browser Implicit Wait  10
  Click Element  xpath=//*[@id="header.link.login"]
  Click Element  xpath=//*[@id="loginPage.userNameInput"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  ${TEACHER_USERNAME}
  Click Element  xpath=//*[@id="loginPage.passwordInput"]
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  ${TEACHER_PASSWORD}
  Click Element  xpath=//*[@id="loginPage.submitButton"]
  Click Element  xpath=//*[@id="tea.menu.mySubjects"]
  Element Should Contain  xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-1"]  Students (0)
  Click Element  xpath=//*[@id="tea.menu.myExamDates"]
  Element Should Contain  xpath=//*[@id="tea.myExamDates.table.participantsButton-1-0"]  Participants (0/10)
  Click Element  xpath=//*[@id="tea.menu.setEvaluation"]
  Click Element  xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]
  Click Element  xpath=//*[@id="tea.setEvaluation.form.examTermDateSelect"]/option[2]
  Element Should Be Present  xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
  Click Element  xpath=//*[@id="tea.menu.evaluationTable"]
  Click Element  xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
  Click Element  xpath=//*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
  Click Element  xpath=//*[@id="tea.evalTable.filter.submitButton"]
  Element Should Be Present  xpath=//*[@id="tea.evalTable"]//td[contains(text(), "No students on this exam date")]
  Sleep  5