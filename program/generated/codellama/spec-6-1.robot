*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Spec 6 Student
    [Setup]    Open Browser    about:blank    Chrome
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    maroon
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Click Element    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Element Should Be Visible    xpath://*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]
    Element Should Contain    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]    Software Quality Assurance
    Element Should Contain    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]    Peter Strict
    Close Browser

Spec 6 Teacher
    [Setup]    Open Browser    about:blank    Chrome
    Go To    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element    xpath://*[@id="tea.menu.mySubjects"]
    Element Should Be Visible    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Click Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Element Should Be Visible    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2) 
    Element Should Contain    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]/td    William Maroon
    Close Browser