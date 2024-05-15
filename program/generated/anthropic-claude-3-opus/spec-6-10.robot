*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Spec 6 Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Page Contains Element    xpath://a[@id="header.link.login"]
    Click Element    xpath://a[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://input[@id="loginPage.userNameInput"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath://input[@id="loginPage.userNameInput"]    TAB
    Input Text    xpath://input[@id="loginPage.passwordInput"]    pass
    Press Keys    xpath://input[@id="loginPage.passwordInput"]    ENTER
    Wait Until Page Contains Element    xpath://a[@id="stu.menu.otherSubjects"]
    Click Element    xpath://a[@id="stu.menu.otherSubjects"]
    Wait Until Page Contains Element    xpath://button[@id="stu.otherSubjects.table.enrollButton-10"]
    Click Element    xpath://button[@id="stu.otherSubjects.table.enrollButton-10"]
    Wait Until Page Contains Element    xpath://div[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath://a[@id="stu.menu.mySubjects"]
    Wait Until Page Contains Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Page Should Contain Element    xpath://tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Close Browser

Spec 6 Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Page Contains Element    xpath://a[@id="header.link.login"]
    Click Element    xpath://a[@id="header.link.login"]
    Wait Until Page Contains Element    xpath://input[@id="loginPage.userNameInput"]
    Input Text    xpath://input[@id="loginPage.userNameInput"]    strict
    Click Element    xpath://input[@id="loginPage.passwordInput"]
    Input Text    xpath://input[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://button[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath://a[@id="tea.menu.mySubjects"]
    Click Element    xpath://a[@id="tea.menu.mySubjects"]
    Wait Until Page Contains Element    xpath://button[@id="tea.mySubjects.table.listOfStudentsButton-3"][text()="Students (2) "]
    Click Element    xpath://button[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Page Should Contain Element    xpath://td[text()="William Maroon"]
    Close Browser