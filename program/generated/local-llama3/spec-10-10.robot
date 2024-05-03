*** Settings ***
Library    SeleniumLibrary
Browser    Chrome

*** Test Cases ***
Spec 10 Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    1
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep    1
    Element Should Be Visible    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.myExamDates.table"]//th[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.newExamDates.table"]//option[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.setEvaluation.table"]//option[contains(text(),"Operating Systems")]
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.evaluationTable.table"]//option[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    1
    Element Should Be Visible    xpath://*[@id="tea.otherSubjects.table"]//td[text()="Operating Systems"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="tea.listOfAllTeachers.table"]//tr[@id="tea.listOfAllTeachers.table.teacherRow-5"]//td[contains(text(),"Operating Systems")]
    Close Browser

Spec 10 Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    1
    Element Should Not Be Visible    xpath://*[@id="stu.otherSubjects.table"]//tr[td[text()="Operating Systems"] and td[text()="Peter Strict"]]
    Close Browser