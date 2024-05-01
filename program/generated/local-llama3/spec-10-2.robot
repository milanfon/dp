*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  browser=Chrome
Suite Teardown  Close Browser

*** Test Cases ***
Teacher
  Open Browser  browser=Chrome
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath=//*[@id="header.link.login"]
  Click Element  xpath=//*[@id="loginPage.userNameInput"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  strict
  Click Element  xpath=//*[@id="loginPage.passwordInput"]
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath=//*[@id="tea.menu.mySubjects"]
  Click Element  xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
  Wait Until Element Is Enabled  xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
  ${elements}=  Get WebElements  xpath=//*[@value="Remove" and @disabled="disabled"]
  Should Be True  ${elements}
  Click Element  xpath=//*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
  Wait Until Element Is Visible  xpath=//*[@id="tea.mySubjects.successAlert"]
  Click Element  xpath=//*[@id="tea.menu.myExamDates"]
  ${elements}=  Get WebElements  xpath=//th[text()="Operating Systems"]
  Should Be Empty  ${elements}
  Click Element  xpath=//*[@id="tea.menu.newExamDates"]
  ${elements}=  Get WebElements  xpath=//option[text()="Operating Systems"]
  Should Be Empty  ${elements}
  Click Element  xpath=//*[@id="tea.menu.setEvaluation"]
  ${elements}=  Get WebElements  xpath=//option[contains(text(), "Operating Systems")]
  Should Be Empty  ${elements}
  Click Element  xpath=//*[@id="tea.menu.evaluationTable"]
  ${elements}=  Get WebElements  xpath=//option[text()="Operating Systems"]
  Should Be Empty  ${elements}
  Click Element  xpath=//*[@id="tea.menu.otherSubjects"]
  ${elements}=  Get WebElements  xpath=//td[text()="Operating Systems"]
  Should Be True  ${elements}
  Click Element  xpath=//*[@id="tea.menu.listOfAllTeachers"]
  ${elements}=  Get WebElements  xpath=//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
  Should Be Empty  ${elements}
  Close Browser

Student
  Open Browser  browser=Chrome
  Set Window Size  1501  1104
  Go To  http://localhost:4680/tbuis/index.jsp
  Click Element  xpath=//*[@id="header.link.login"]
  Click Element  xpath=//*[@id="loginPage.userNameInput"]
  Input Text  xpath=//*[@id="loginPage.userNameInput"]  orange
  Click Element  xpath=//*[@id="loginPage.passwordInput"]
  Input Text  xpath=//*[@id="loginPage.passwordInput"]  pass
  Click Element  xpath=//*[@id="loginPage.loginFormSubmit"]
  Click Element  xpath=//*[@id="stu.menu.otherSubjects"]
  ${elements}=  Get WebElements  xpath=//tr[contains(text(), "Operating Systems")]//td[contains(text(), "Peter Strict")]
  Should Be Empty  ${elements}
  Close Browser