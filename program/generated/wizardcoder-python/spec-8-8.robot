```
*** Settings ***
Library  SeleniumLibrary  timeout=5  implicit_wait=0.5

*** Variables ***
${BROWSER}  Chrome
${BASE_URL}  http://localhost:4680
${DELAY}  0.5s

*** Test Cases ***

Spec 8 Student
  Open Browser  ${BASE_URL}  ${BROWSER}
  Set Window Size  800  600
  Input Text  id:loginPage.userNameInput  green
  Input Text  id:loginPage.passwordInput  pass
  Click Button  id:loginPage.loginFormSubmit
  Click Link  id:stu.menu.otherExamDates
  Click Button  id:stu.otherExamDates.table.registerButton-2-0
  ${registered}=  Run Keyword And Return Status  Wait Until Element Is Visible  id:stu.otherExamDates.successAlert  ${DELAY}
  Run Keyword If  ${registered}  Element Should Be Visible  id:stu.otherExamDates.successAlert
  Click Link  id:stu.menu.myExamDates
  Element Should Be Visible  xpath://td[contains(text(), 'Programming in Java')]
  Close Browser

Spec 8 Teacher
  Open Browser  ${BASE_URL}/index.jsp  ${BROWSER}
  Set Window Size  800  600
  Input Text  id:loginPage.userNameInput  strict
  Input Text  id:loginPage.passwordInput  pass
  Click Button  id:loginPage.loginFormSubmit
  Click Link  id:tea.menu.myExamDates
  Click Button  id:tea.myExamDates.table.participantsButton-1-0
  Element Should Be Visible  xpath://td[contains(text(), 'Mia Orange')
  Close Browser