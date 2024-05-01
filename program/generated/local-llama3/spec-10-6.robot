*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${EMPTY}    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
Scenario 10 Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1
    Element Should Be Visible    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Element Should Not Be Visible    xpath://*[@id="tea.myExamDates.table"]//th[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Element Should Not Be Visible    xpath://*[@id="tea.newExamDates.table"]//option[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Element Should Not Be Visible    xpath://*[@id="tea.setEvaluation.table"]//option[contains(text(), "Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Element Should Not Be Visible    xpath://*[@id="tea.evaluationTable.table"]//option[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Element Should Be Visible    xpath://*[@id="tea.otherSubjects.table"]//td[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Element Should Not Be Visible    xpath://*[@id="tea.listOfAllTeachers.table"]//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(), "Operating Systems")]
    Close Browser

Scenario 10 Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Element Should Not Be Visible    xpath://*[@id="stu.otherSubjects.table"]//tr[td[text()="Operating Systems"] and td[text()="Peter Strict"]]
    Close Browser