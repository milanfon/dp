*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome  executable_path=C:/path/to/chromedriver
Suite Teardown  Close Browser

*** Variables ***
${BASE_URL}  http://localhost:4680
${STUDENT_USERNAME}  gray
${STUDENT_PASSWORD}  pass
${TEACHER_USERNAME}  pedant
${TEACHER_PASSWORD}  pass

*** Test Cases ***
Student Login
  Open Browser  ${BASE_URL}  chrome
  Set Window Size  1501  1104
  Click Element  xpath=//*[@id="header.link.login"]
  Click Element  xpath=//*[@id="loginPage.userNameInput"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  ${STUDENT_USERNAME}
  Click Element  xpath=//*[@id="loginPage.passwordInput"]
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  ${STUDENT_PASSWORD}
  Click Element  xpath=//*[@id="loginPage.submitButton"]
  Click Element  xpath=//*[@id="stu.menu.mySubjects"]
  Click Element  xpath=//*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
  Click Element  xpath=//*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
  Wait Until Element Is Visible  xpath=//*[@id="stu.mySubjects.successAlert"]
  Element Should Be Visible  xpath=//*[@id="stu.mySubjects.enrolledTable.Title"]
  Element Should Not Be Visible  xpath=//td[text()='Database Systems']

Teacher Login
  Open Browser  ${BASE_URL}  chrome
  Set Window Size  1501  1104
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
  Element Should Be Visible  xpath=//*[@id="tea.setEvaluation.form.noOneStudent"]
  Click Element  xpath=//*[@id="tea.menu.evaluationTable"]
  Click Element  xpath=//*[@id="tea.evalTable.filter.subjectSelect"]
  Click Element  xpath=//*[@id="tea.evalTable.filter.subjectSelect"]/option[3]
  Click Element  xpath=//*[@id="tea.evalTable.filter.submitButton"]
  Element Should Contain  xpath=//td  No students on this exam date
  Sleep  5
  Close Browser