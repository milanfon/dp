*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Student scenario
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Input Text    id:loginPage.userNameInput    gray
    Input Text    id:loginPage.passwordInput    pass
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Click Element    xpath://*[@id="loginPage.loginButton"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Click Element    xpath://*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element    xpath://*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Click Element    xpath://*[@id="stu.menu.mySubjects"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.successAlert"]
    Element Should Be Visible    xpath://*[@id="stu.mySubjects.enrolledTable.Title"]
    Element Should Not Be Visible    xpath://*[contains(text(), 'Database Systems')]
    Close All Browsers