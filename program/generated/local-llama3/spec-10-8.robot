*** Settings ***
Library         SeleniumLibrary
Suite Setup     Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown  Close Browser

*** Test Cases ***
Teacher View
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Click Element    xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Wait Until Element Is Visible    xpath://*[@id="tea.mySubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Element Should Not Contain    xpath://*[@id="tea.myExamDates.table"]    Operating Systems
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Element Should Not Contain    xpath://*[@id="tea.newExamDates.table"]    Operating Systems
    Click Element    xpath://*[@id="tea.menu.setEvaluation"]
    Element Should Not Contain    xpath://*[@id="tea.setEvaluation.table"]    Operating Systems
    Click Element    xpath://*[@id="tea.menu.evaluationTable"]
    Element Should Not Contain    xpath://*[@id="tea.evaluationTable.table"]    Operating Systems
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Element Should Contain    xpath://*[@id="tea.otherSubjects.table"]    Operating Systems
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Element Should Not Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]    Operating Systems
    Sleep    1s
    Close Browser
    Sleep    1s
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Sleep    1s

Student View
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    orange
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Element Should Not Contain    xpath://*[@id="stu.otherSubjects.table"]    Peter Strict
    Element Should Not Contain    xpath://*[@id="stu.otherSubjects.table"]    Operating Systems
    Sleep    1s
    Close Browser