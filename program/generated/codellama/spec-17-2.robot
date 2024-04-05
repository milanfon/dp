*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Teacher Test
    [Setup]    Open Browser    about:blank    Chrome
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Wait Until Element Is Visible    xpath://*[@id="tea.otherSubjects.successAlert"]
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Wait Until Element Is Visible    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Wait Until Element Is Visible    xpath://*[@id="tea.newExamDates.table.noRecords-2"]
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Element Is Visible    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    Linear Algebra
    Element Should Contain    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Close Browser

Student Test
    [Setup]    Open Browser    about:blank    Chrome
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Element Should Contain    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Should Contain    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Close Browser