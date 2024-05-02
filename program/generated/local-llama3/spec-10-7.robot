*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome  executable_path=/path/to/chromedriver
Suite Teardown  Close Browser

*** Test Cases ***
Scenario 1
    Open Browser  chrome  executable_path=/path/to/chromedriver
    Go To  http://localhost:4680/tbuis/index.jsp
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="tea.menu.mySubjects"]
    Click Element  xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep  2
    Element Should Be Visible  xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element  xpath://*[@id="tea.menu.myExamDates"]
    Element Should Not Be Visible  xpath://*[@id="tea.myExamDates.table"]//th[contains(text(), "Operating Systems")]
    Click Element  xpath://*[@id="tea.menu.newExamDates"]
    Element Should Not Be Visible  xpath://*[@id="tea.newExamDates.table"]//option[contains(text(), "Operating Systems")]
    Click Element  xpath://*[@id="tea.menu.setEvaluation"]
    Element Should Not Be Visible  xpath://*[@id="tea.setEvaluation.table"]//option[contains(text(), "Operating Systems")]
    Click Element  xpath://*[@id="tea.menu.evaluationTable"]
    Element Should Not Be Visible  xpath://*[@id="tea.evaluationTable.table"]//option[contains(text(), "Operating Systems")]
    Click Element  xpath://*[@id="tea.menu.otherSubjects"]
    Element Should Be Visible  xpath://*[@id="tea.otherSubjects.table"]//td[contains(text(), "Operating Systems")]
    Click Element  xpath://*[@id="tea.menu.listOfAllTeachers"]
    Element Should Not Be Visible  xpath://*[@id="tea.listOfAllTeachers.table"]//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser

Scenario 2
    Open Browser  chrome  executable_path=/path/to/chromedriver
    Go To  http://localhost:4680/tbuis/index.jsp
    Click Element  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="stu.menu.otherSubjects"]
    Element Should Not Be Visible  xpath://*[@id="stu.otherSubjects.table"]//tr[contains(text(), "Operating Systems")]//td[contains(text(), "Peter Strict")]
    Close Browser